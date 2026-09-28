# 映像技法辞典（400種以上）の索引

カメラの動き、ショット、アングル、構図、照明、レンズ、色、大気、時間、エフェクト、編集、ジャンル、トレンドのルックまで、400種以上の映像技法を13分類・12ファイルにまとめた辞典。技法の名前（英語・日本語の呼び名）から、画面で起きることと、Seedance 2.5 のプロンプトに書く記述例を引く。

撮影の原則（英語の映画用語＋日本語補足、1区間に主要なカメラの動きは1つ、速度語を添える、日本の現場用語の変換）は、[camera-movements.md](../camera-movements.md)・[shot-composition.md](../shot-composition.md)・[lens-and-focus.md](../lens-and-focus.md)・[lighting-color.md](../lighting-color.md)・[multi-shot-continuity.md](../multi-shot-continuity.md) のガイドが優先する。この辞典は語彙の網羅を受け持つ。

---

## 使い方

1. **必要な分類のファイルだけを読む。** ユーザーが挙げた技法名・日本語の呼び名・雰囲気から下の表で分類を決め、1〜2ファイルに絞る。全ファイルを読み込まない。
2. **記述例は型として使う。** 被写体・場所・方向・速度を依頼に合わせて書き換える。例文をそのまま貼らない。
3. **名前ではなく中身を書く。** プリセット名や通称（Eyes In、Agamemnon、Pearl Earring など）は、Seedance が名前を理解する保証がない。記述例のように光・色・動き・質感の要素へ分解して書く。
4. **作品名・監督名・画家名に頼らない。** 再現性が低く、特定作品の複製を狙う書き方にもなるため、画面の要素で書く。
5. **項目ごとに書き分ける。** カメラの動きは「カメラ」、照明・色・エフェクト・ルックは「見た目」、天候は「環境」の項目へ置く（[SKILL.md](../../SKILL.md) の8項目）。1区間に重ねるのは、主要なカメラの動き1つと、見た目の指定数個までにする。
6. **両立しない指示を重ねない。** 例：`static locked-off` と `handheld`、`one-take shot` と `jump cut`、`deep focus` と `shallow depth of field`。
7. **画面の文字は崩れやすい。** タイポグラフィ、空中UI、雑誌の見出し、画面内画面の細かい文字は、正確さを保証せず後編集を提案する。

---

## 分類とファイル

| ファイル | 分類 | 種類 | 主な技法 | 詳しいガイド |
|---|---|---|---|---|
| [camera-movement.md](camera-movement.md) | カメラの動き | 86 | ズーム、ドリー、横移動・追従、パン・チルト、クレーン、アーク・オービット、ドリーズーム、手持ち・ステディカム、空撮・FPV、通り抜け、乗り物 | [camera-movements.md](../camera-movements.md) |
| [framing-angles.md](framing-angles.md) | ショットサイズ（25）とアングル（19） | 44 | ECU〜ELS、エスタブリッシング、OTS、インサート、アイレベル、あおり・俯瞰、ダッチアングル、POV、第四の壁 | [shot-composition.md](../shot-composition.md) |
| [composition.md](composition.md) | 構図 | 32 | 三分割、黄金比、対称、誘導線、一点透視、額縁、前景、余白、ヴォイド、反射 | [shot-composition.md](../shot-composition.md) |
| [lighting.md](lighting.md) | ライティング | 41 | 三点照明、レンブラント、バタフライ、ハイキー・ローキー、シルエット、実光源、ゴールデンアワー、光芒 | [lighting-color.md](../lighting-color.md) |
| [lenses.md](lenses.md) | レンズと光学 | 17 | 14〜200mm、圧縮効果、アナモルフィック、魚眼、ティルトシフト、スプリットディオプター、マクロ | [lens-and-focus.md](../lens-and-focus.md) |
| [color.md](color.md) | 色とフィルムルック | 19 | ティール＆オレンジ、銀残し、モノクロ、セピア、スプリットトーン、アメリカの夜、クロスプロセス | [lighting-color.md](../lighting-color.md) |
| [atmosphere.md](atmosphere.md) | 大気と天候 | 13 | 雨、霧、もや、煙、光の中の埃、雪、濡れた路面、火の粉、砂嵐、水中 | — |
| [time-motion.md](time-motion.md) | 時間と動き | 21 | スロー、早回し、スピードランプ、時間停止、逆再生、タイムラプス、コマ撮り、長回し | [prompt-syntax.md](../prompt-syntax.md) |
| [effects.md](effects.md) | 撮影・光学・映像エフェクト | 57 | フレア、ボケ、ピン送り、赤外線、二重露光、分身、モーフィング、浮遊、ジオラマ、データモッシュ | [lens-and-focus.md](../lens-and-focus.md) |
| [editing.md](editing.md) | 編集とトランジション | 23 | マッチカット、アクションつなぎ、ジャンプカット、スマッシュカット、ディゾルブ、クロスカッティング、分割画面 | [multi-shot-continuity.md](../multi-shot-continuity.md) |
| [genre-looks.md](genre-looks.md) | ジャンルと映像様式 | 27 | フィルム・ノワール、ヌーヴェルヴァーグ、マカロニ・ウエスタン、武侠、ドキュメンタリー、ヴェイパーウェイヴ | — |
| [viral-looks.md](viral-looks.md) | トレンドのルック | 44 | 油彩、印象派、墨のしぶき、アメコミ風、フィギュア、パパラッチ写真、大理石、動物に乗る | — |

合計400種以上（framing-angles.md はショットサイズとアングルの2分類をまとめている）。

---

## 日本語の呼び名から探す

ユーザーが日本語の現場語で頼んだときの逆引き。英語の意味がずれる語は、必ず右の英語へ変換してから書く。

| 日本語の呼び名 | 技法（英語） | ファイル |
|---|---|---|
| 寄る／トラックアップ／T.U | Dolly In・Push In（本体が前進）または Zoom（レンズ）。どちらか確定させる | camera-movement |
| 引く／トラックバック／T.B | Dolly Out・Pull Out または Zoom | camera-movement |
| 横移動／トラック | Trucking（truck left / right） | camera-movement |
| パンアップ／パンダウン | Tilt Up / Tilt Down | camera-movement |
| めまいショット／ヒッチコックズーム | Dolly Zoom | camera-movement |
| 回り込み／周回 | Arc / 360-Degree Orbit | camera-movement |
| 空撮／ドローン | Aerial / FPV Drone | camera-movement |
| 手持ち／ハンディ | Handheld | camera-movement |
| 固定／フィックス | Static Locked-Off / Fixed Cam | camera-movement |
| ウエストショット（WS） | Medium Shot（`waist-up`）。英語の WS は Wide Shot なので略号を書かない | framing-angles |
| バストショット（BS） | Medium Close-Up | framing-angles |
| あおり | Low Angle / Worm's-Eye View | framing-angles |
| 俯瞰／真俯瞰 | High Angle / Overhead Top-Down | framing-angles |
| 切り返し | Reverse Angle / Over-the-Shoulder Coverage | framing-angles |
| 肩なめ／なめ | Over-the-Shoulder Coverage / Foreground Interest / Dirty Frame | framing-angles・composition |
| 主観／一人称 | Point of View / First-Person | framing-angles |
| カメラ目線 | Fourth Wall | framing-angles |
| 日の丸構図 | Centered Composition | composition |
| 額縁構図 | Frame within Frame | composition |
| 逆光 | Backlight / Silhouette | lighting |
| 木漏れ日 | Dappled Light | lighting |
| 光芒／天使の梯子 | Volumetric Light | lighting |
| 銀残し | Bleach Bypass | color |
| アメリカの夜（擬似夜景） | Day for Night | color |
| 白飛び | Overexposed | color |
| 早回し | Fast Motion | time-motion |
| コマ撮り | Stop Motion | time-motion |
| 長回し／ワンカット | Long Take / Oner | time-motion |
| 逆再生 | Reverse Motion | time-motion |
| ピン送り | Rack Focus / Focal Shift | effects |
| パンフォーカス | Deep Focus | effects |
| 多重露光 | Double Exposure | effects |
| オーバーラップ | Dissolve | editing |
| 溶明／溶暗（F.I／F.O） | Fade In / Fade Out | editing |
| カットバック（2つの場面を交互に） | Cross-Cutting | editing |
| 画面分割 | Split Screen | editing |
| アクションつなぎ | Match on Action | editing |

---

## 確度

- 各技法の説明と記述例は、一般的な撮影・編集・映像表現の知識を基に、このリポジトリで書き下ろしたもの。**Seedance の公式資料には含まれない。**
- どの語や記述が Seedance 2.5 で効くかは検証していない（**【未確認】**）。ユーザーへ断定して伝えず、生成結果を見て調整する。Seedance のモデルが解釈する語彙として解説されているものは [prompt-syntax.md](../prompt-syntax.md) の §7 にある。
- プリセット名・通称・ジャンル名は呼び方に揺れがある。名前の意味が曖昧なときは、記述例の要素で意図を確認する。
