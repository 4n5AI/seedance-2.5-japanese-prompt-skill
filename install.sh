#!/bin/sh
# seedance-25 Skill を各生成AIエージェントの skills ディレクトリへ配置するスクリプト。
# POSIX sh 互換（sh / dash / bash で動作。zsh がログインシェルでも `sh install.sh` で実行する）。
# クローンしたリポジトリ内に置いたまま、どのディレクトリからでも実行できる（--project は現在のディレクトリ基準）。
#
#   sh install.sh <target> [<target> ...] [--dir <skillsディレクトリ>] [--project] [--link] [--force] [--list]
#   sh install.sh all --list
#
# target:
#   agents       共通ディレクトリ（Agent Skills 標準の慣例。Codex / Gemini CLI / GitHub Copilot / OpenCode / Cursor などが読む。Claude Code は読まない）
#   claude       Claude Code
#   antigravity  Google Antigravity（ユーザー全体は2つの候補パスに配置する。詳細は README を参照）
#   codex        OpenAI Codex の従来パス（$CODEX_HOME/skills。通常は agents を使う）
#   gemini       Gemini CLI 専用ディレクトリ
#   cursor       Cursor 専用ディレクトリ
#   copilot      GitHub Copilot 専用ディレクトリ
#   opencode     OpenCode 専用ディレクトリ
#   all          agents + claude + antigravity（同じ Skill を複数のディレクトリから重複して読まずに全エージェントをカバーする組み合わせ）
#
# オプション:
#   --project    ホームディレクトリではなく、現在のディレクトリ配下（プロジェクト内のパス）へ配置する
#   --dir <path> 任意の skills ディレクトリへ配置する（<path>/seedance-25 が作られる）
#   --link       コピーではなく、このリポジトリへのシンボリックリンクを置く（git pull で更新できる）
#   --force      既存の同名 Skill を削除して置き換える（既定ではその配置先をスキップし、終了コード1で終了する）
#   --list       配置先を表示して終了する
#
# 終了コード: 0 成功 / 1 一部の配置先をスキップまたは失敗 / 2 引数の誤り

# zsh で直接実行された場合も sh と同じ単語分割にする（他のシェルでは何もしない）
if [ -n "${ZSH_VERSION:-}" ]; then setopt shwordsplit 2>/dev/null || true; fi

set -eu
set -f

SKILL_NAME="seedance-25"
REPO_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
TARGET_NAMES="agents claude antigravity codex gemini cursor copilot opencode"
ALL_SET="agents claude antigravity"
NL='
'

usage() {
  printf '%s\n' \
    "使い方: sh install.sh <target> [<target> ...] [--dir <skillsディレクトリ>] [--project] [--link] [--force] [--list]" \
    "" \
    "target        エージェント            ユーザー全体（既定）                                     プロジェクト内（--project）" \
    "  agents      共通（Agent Skills）    ~/.agents/skills                                          .agents/skills" \
    "  claude      Claude Code             \${CLAUDE_CONFIG_DIR:-~/.claude}/skills                    .claude/skills" \
    "  antigravity Google Antigravity      ~/.gemini/config/skills と ~/.gemini/antigravity/skills   .agents/skills" \
    "  codex       OpenAI Codex（従来）    \${CODEX_HOME:-~/.codex}/skills                            .codex/skills" \
    "  gemini      Gemini CLI              ~/.gemini/skills                                          .gemini/skills" \
    "  cursor      Cursor                  ~/.cursor/skills                                          .cursor/skills" \
    "  copilot     GitHub Copilot          ~/.copilot/skills                                         .github/skills" \
    "  opencode    OpenCode                \${XDG_CONFIG_HOME:-~/.config}/opencode/skills             .opencode/skills" \
    "  all         agents + claude + antigravity（重複なしで全エージェントをカバー）" \
    "" \
    "オプション:" \
    "  --project     ホームではなく現在のディレクトリ配下（右列のパス）へ配置する" \
    "  --dir <path>  任意の skills ディレクトリへ配置する（<path>/$SKILL_NAME が作られる）" \
    "  --link        コピーではなく、このリポジトリへのシンボリックリンクを置く" \
    "  --force       既存の同名 Skill を削除して置き換える（既定ではスキップして終了コード1）" \
    "  --list        配置先を表示して終了する"
}

# target 名 → skills ディレクトリ（ユーザー全体）。複数ある場合は1行に1つ。
user_dirs() {
  case "$1" in
    agents)      printf '%s\n' "$HOME/.agents/skills" ;;
    claude)      printf '%s\n' "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills" ;;
    antigravity) printf '%s\n' "$HOME/.gemini/config/skills" "$HOME/.gemini/antigravity/skills" ;;
    codex)       printf '%s\n' "${CODEX_HOME:-$HOME/.codex}/skills" ;;
    gemini)      printf '%s\n' "$HOME/.gemini/skills" ;;
    cursor)      printf '%s\n' "$HOME/.cursor/skills" ;;
    copilot)     printf '%s\n' "$HOME/.copilot/skills" ;;
    opencode)    printf '%s\n' "${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills" ;;
  esac
}

# target 名 → skills ディレクトリ（プロジェクト内。カレントディレクトリ基準）
project_dirs() {
  case "$1" in
    agents)      printf '%s\n' ".agents/skills" ;;
    claude)      printf '%s\n' ".claude/skills" ;;
    antigravity) printf '%s\n' ".agents/skills" ;;
    codex)       printf '%s\n' ".codex/skills" ;;
    gemini)      printf '%s\n' ".gemini/skills" ;;
    cursor)      printf '%s\n' ".cursor/skills" ;;
    copilot)     printf '%s\n' ".github/skills" ;;
    opencode)    printf '%s\n' ".opencode/skills" ;;
  esac
}

targets=""
custom_dir=""
scope="user"
mode="copy"
force="no"
list_only="no"

add_target() {
  case " $targets " in
    *" $1 "*) ;;
    *) targets="${targets:+$targets }$1" ;;
  esac
}

while [ $# -gt 0 ]; do
  case "$1" in
    --project) scope="project" ;;
    --link)    mode="link" ;;
    --force)   force="yes" ;;
    --list)    list_only="yes" ;;
    --dir)
      case "${2:-}" in
        ""|-*) printf '%s\n' "--dir にはディレクトリを指定してください（- で始まる名前は ./ を付けてください）" >&2; exit 2 ;;
      esac
      custom_dir="$2"; shift ;;
    -h|--help) usage; exit 0 ;;
    all)       for t in $ALL_SET; do add_target "$t"; done ;;
    -*)        printf '%s\n' "不明なオプションです: $1" >&2; usage >&2; exit 2 ;;
    *)
      case " $TARGET_NAMES " in
        *" $1 "*) add_target "$1" ;;
        *) printf '%s\n' "不明な target です: $1" >&2; usage >&2; exit 2 ;;
      esac
      ;;
  esac
  shift
done

if [ -z "$targets" ] && [ -z "$custom_dir" ]; then
  usage >&2
  exit 2
fi

if [ -n "$targets" ] && [ "$scope" = "user" ] && [ -z "${HOME:-}" ]; then
  printf '%s\n' "環境変数 HOME が設定されていないため、ユーザー全体の配置先を決められません（--project または --dir を使ってください）" >&2
  exit 2
fi

# Skill 本体がそろっているか確認する（install.sh をリポジトリ外へコピーして実行した場合の診断）
for f in SKILL.md references/source-guide.md; do
  if [ ! -f "$REPO_ROOT/$f" ]; then
    printf '%s\n' "必要なファイルが見つかりません: $REPO_ROOT/$f（install.sh はクローンしたリポジトリ内、SKILL.md と同じ階層に置いたまま実行してください）" >&2
    exit 1
  fi
done

# 配置先 skills ディレクトリの一覧を改行区切りで作る（重複は除く。空白やグロブ文字を含むパスも壊さない）
parents=""
add_parent() {
  case "$NL$parents$NL" in
    *"$NL$1$NL"*) ;;
    *) parents="${parents:+$parents$NL}$1" ;;
  esac
}
for t in $targets; do
  if [ "$scope" = "project" ]; then
    dirs=$(project_dirs "$t")
  else
    dirs=$(user_dirs "$t")
  fi
  IFS="$NL"
  for d in $dirs; do add_parent "$d"; done
  unset IFS
done
if [ -n "$custom_dir" ]; then
  p="$custom_dir"
  while [ "$p" != / ] && [ "${p%/}" != "$p" ]; do p="${p%/}"; done
  add_parent "$p"
fi

rc=0
IFS="$NL"
for parent in $parents; do
  # for の単語リストはループ開始時に展開済みなので、本体では IFS を既定に戻してよい
  unset IFS
  target="${parent%/}/$SKILL_NAME"

  if [ "$list_only" = "yes" ]; then
    printf '%s\n' "$target"
    continue
  fi

  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ "$force" != "yes" ]; then
      printf '%s\n' "既に存在するため変更しません（--force で置き換え）: $target" >&2
      rc=1
      continue
    fi
    if ! rm -rf -- "$target"; then
      printf '%s\n' "既存の Skill を削除できません: $target" >&2
      rc=1
      continue
    fi
  fi

  if ! mkdir -p -- "$parent"; then
    printf '%s\n' "配置先を作成できません: $parent" >&2
    rc=1
    continue
  fi

  if [ "$mode" = "link" ]; then
    if ln -s -- "$REPO_ROOT" "$target"; then
      printf '%s\n' "リンクを作成しました: $target -> $REPO_ROOT"
    else
      printf '%s\n' "リンクを作成できません: $target" >&2
      rc=1
    fi
  else
    # 一時ディレクトリへコピーし、すべて成功した場合のみ配置先へ移動する（途中で失敗しても半端な Skill を残さない）
    tmp="$parent/.$SKILL_NAME.tmp.$$"
    rm -rf -- "$tmp"
    if mkdir -- "$tmp" \
      && cp -- "$REPO_ROOT/SKILL.md" "$tmp/" \
      && cp -R -- "$REPO_ROOT/references" "$tmp/" \
      && { [ ! -d "$REPO_ROOT/agents" ] || cp -R -- "$REPO_ROOT/agents" "$tmp/"; } \
      && mv -- "$tmp" "$target"; then
      printf '%s\n' "インストールしました: $target"
    else
      rm -rf -- "$tmp"
      printf '%s\n' "配置に失敗したため取り消しました: $target" >&2
      rc=1
    fi
  fi
done
unset IFS

if [ "$rc" -ne 0 ]; then
  printf '%s\n' "一部の配置先をスキップまたは失敗しました。" >&2
fi
exit "$rc"
