# レンズ・焦点距離・被写界深度ガイド

「どのレンズで撮った絵か」をプロンプトで言語化するための参照。カメラの動きは [camera-movements.md](camera-movements.md)、ショットサイズ・アングル・構図は [shot-composition.md](shot-composition.md)、光と色は [lighting-color.md](lighting-color.md)、Seedance 2.5 固有の記法は [prompt-syntax.md](prompt-syntax.md) を参照する。

---

## 0. 大原則：数値ではなく「見え方」を書く

1. **裸の数値スペックだけでは効きにくい。** `f/2.8`・`ISO 800`・`24fps`・`T2.8`・`2x squeeze` のような技術仕様は、モデルが解釈しない可能性が高い。Seedance 2.0 の解説では技術仕様を避けるよう明記され、2.5 の解説ではレンズの記述を必須ブロックとする。**どちらも第三者記事で、公式の一次文面は未確認。**
2. **数値を書くなら必ず効果の言葉を添える。** `85mm portrait-lens look, shallow depth of field, background compressed and softly blurred` のように、数値の後に「その結果どう見えるか」を書く。数値だけを置かない。
3. **ショット記述の順序**は `ショットサイズ → レンズの記述 → カメラの動き（＋速度） → フレーミング` を目安にする。
4. `cinematic` の一語より、具体語の積み上げが常に勝つ。

---

## 1. 焦点距離 → 画角 早見表

35mm判フルサイズ（36×24mm、対角 43.27mm）換算。**直線を直線に写すレクチリニア設計を前提とした計算値**で、公式 `画角 = 2 × arctan(センサー寸法 ÷ (2 × 焦点距離))` から算出し、50mm 行が公開されている実測表と一致することを確認している。

| 焦点距離 | 対角画角 | 水平画角 | 垂直画角 | 区分 | 一言で |
|---|---|---|---|---|---|
| 14 mm | 114.2° | 104.3° | 81.2° | 超広角 | 環境ごと飲み込む／不安定 |
| 16 mm | 107.0° | 96.7° | 73.7° | 超広角 | 狭い室内を広く見せる |
| 18 mm | 100.5° | 90.0° | 67.4° | 超広角 | 空間の広さを誇張 |
| 20 mm | 94.5° | 84.0° | 61.9° | 超広角 | 建築・空撮の全景 |
| 24 mm | 84.1° | 73.7° | 53.1° | 超広角〜広角 | 情景説明（establishing） |
| 25 mm | 81.7° | 71.5° | 51.3° | 広角 | シネの定番の広角 |
| 28 mm | 75.4° | 65.5° | 46.4° | 広角 | 環境つきの人物 |
| 32 mm | 68.1° | 58.7° | 41.1° | 広角 | シネの「広めの標準」 |
| 35 mm | 63.4° | 54.4° | 37.8° | 広角〜標準 | 臨場感・ドキュメンタリー |
| 40 mm | 56.8° | 48.5° | 33.4° | 標準 | 自然に近いとされる画角 |
| 43.27 mm | 53.1° | 45.2° | 31.0° | 標準 | 対角＝焦点距離の理論上の標準 |
| 50 mm | 46.8° | 39.6° | 27.0° | 標準 | 自然な会話・立ち話 |
| 65 mm | 36.8° | 31.0° | 20.9° | 標準〜中望遠 | 切り離しが始まる |
| 75 mm | 32.2° | 27.0° | 18.2° | 中望遠 | バストショット |
| 85 mm | 28.6° | 23.9° | 16.1° | 中望遠 | ポートレートの定番 |
| 100 mm | 24.4° | 20.4° | 13.7° | 中望遠 | 顔の圧縮＋強いボケ |
| 135 mm | 18.2° | 15.2° | 10.2° | 中望遠〜望遠 | 濃密な感情のクローズアップ |
| 200 mm | 12.3° | 10.3° | 6.9° | 望遠 | 覗き見・監視・孤立 |
| 300 mm | 8.2° | 6.9° | 4.6° | 望遠〜超望遠 | 極端な平坦化 |
| 400 mm | 6.2° | 5.2° | 3.4° | 超望遠 | 遠景が壁のように潰れる |

- 焦点距離が2倍になると画角は狭くなり、**写る面積は約1/4**になる。
- **8mm・12mm 級の実在レンズは魚眼設計（対角180°級）が主流**で、上の計算式は成立しない。魚眼を狙うときは画角の数値ではなく `fisheye lens, extreme barrel distortion, circular frame` のように見え方で書く。
- 区分の境界は流派によってずれる（「広角は35mmまで」「望遠は135mmから」など）。上表は一般的な一例。

### センサー別の換算

`35mm換算 = 実焦点距離 × クロップファクター`、`クロップファクター = 43.27mm ÷ そのセンサーの対角長`（計算値）。

| フォーマット | 寸法 | 対角 | 係数 |
|---|---|---|---|
| フルサイズ／35mm判 | 36 × 24 mm | 43.27 mm | 1.00 |
| Super 35（クラシック） | 24.89 × 18.66 mm | 31.11 mm | 約1.39 |
| Super 35（大判寄りのオープンゲート） | 27.99 × 19.22 mm | 33.95 mm | 約1.27 |
| APS-C（一般） | 約23.5 × 15.6 mm | 約28.2 mm | 約1.5 |
| APS-C（1.6倍系） | 約22.3 × 14.9 mm | 約26.8 mm | 約1.6 |
| マイクロフォーサーズ | 17.3 × 13.0 mm | 約21.6 mm | 2.00 |

**「Super 35」は一義に決まらない**（機種・ゲートにより約1.27〜1.39）。単一の数値として断定せず、幅で扱う。

---

## 2. 焦点距離帯ごとの効果とプロンプト語彙

| 帯 | 見え方・心理効果 | プロンプトに書く英語 |
|---|---|---|
| **超広角 14–24mm** | 遠近感を極端に誇張。近景が巨大化し遠景が急激に縮む。四隅は引き伸ばされ、垂直物が傾く。被写界深度は深い。観客をアクションの真ん中に置く没入感。文脈次第で混乱・不安定・ヒーロー的な誇張 | `ultra-wide-angle`, `exaggerated perspective`, `sweeping environment`, `deep focus`, `immersive`, `disorienting`, `looming foreground` |
| **広角 24–35mm** | 環境の中に人物を置く。臨場感。ドキュメンタリー、歩き回る人物の追従 | `wide shot`, `35mm-lens look`, `environment held in frame`, `handheld`, `spatial depth` |
| **標準 40–50mm** | 誇張も圧縮もない自然な距離感。会話・対話 | `normal lens`, `natural perspective`, `neutral depth`, `conversational framing` |
| **中望遠 75–135mm** | 背景を引き寄せて被写体を浮かせる。顔のバランスが整う。ポートレートの本命 | `short telephoto`, `85mm portrait-lens look`, `shallow depth of field`, `subject isolated from a softly compressed background`, `creamy bokeh` |
| **望遠 200mm以上** | 奥行きの手がかりが消え、空間が強く平坦化する。離れた要素が密着して見える。覗き見・監視・孤立。望遠鏡の見え方を模すため、監視や盗み見を扱う映画の定番 | `long telephoto`, `heavy telephoto compression`, `flattened space`, `voyeuristic`, `observed from a distance` |

なぜ標準が「自然」とされるかには**諸説ある**。フルサイズの対角が約43mmで、対角＝焦点距離の関係から理論上の標準は50mmではなく43mm、という説明が一つ。40mm前後が意識的な人間知覚に近いという評価もあるが、これは主観的な評価であり実証データではない。**「50mm＝人間の視野」という説明には明確な反論がある**（50mmの対角画角は約47°だが人の有効視野はもっと広い）。ユーザーへ「人間の目と同じ」と断定して説明しない。

---

## 3. 圧縮効果の正しい理解（重要）

**遠近感の強さ・圧縮の度合いは、カメラと被写体の距離で決まる。焦点距離では決まらない。**

同じ位置から広角で撮って中央をトリミングした絵と、同じ位置から望遠で撮った絵は、被写体間の間隔＝圧縮の度合いが同じになる。望遠レンズは「距離を取った結果すでに起きている圧縮」を拡大して見せているだけである。

顔についても同じ。**顔の歪みは焦点距離ではなく寄りすぎが原因。** 「望遠だから顔が整う」ではなく「望遠だから離れて撮れて、結果として顔が整う」。

プロンプトでは**距離とレンズを両方書く**。

- 良い：`shot from far away with a long telephoto lens, background compressed close behind the subject`
- 良い：`camera very close on a wide-angle lens, foreground looming, background falling away fast`
- 不足：`telephoto lens` だけ書いて圧縮を期待する

ただし世の中の解説の多くは「望遠レンズの圧縮効果」という慣用的な言い方をしており、モデルも `telephoto compression` という語彙に反応する可能性が高い。**プロンプトでは慣用語を使い、ユーザーへ説明するときは距離が支配的だと正確に伝える。**

---

## 4. 被写界深度とボケ

深度が**浅くなる**条件：絞りを開ける（F値が小さい）／焦点距離が長い／被写体に近い。加えてセンサーが大きいほど浅くなるとされるが、日本語の主要な解説はF値・焦点距離・撮影距離の3要素を挙げるものが多い（**センサーサイズは未確認**）。

| 狙い | プロンプト語 |
|---|---|
| 被写体の分離 | `shallow depth of field`, `subject isolation`, `background dissolved into soft bokeh` |
| 文脈の提示 | `deep focus`, `foreground, mid-ground and background all sharp` |
| 玉ボケ | `circular bokeh balls`, `out-of-focus highlights` |
| 前ボケで額縁を作る | `foreground bokeh`, `soft foreground element framing the subject` |
| ショット中の焦点移動 | `rack focus from the foreground to the subject` |
| 開放の柔らかさ | `wide open, glowing highlights, gentle falloff` |

- 浅い深度は**どこを見るかを決める**。深い深度は**複数の面に情報を同時に置ける**。
- 手前と奥の両方に物語情報があるとき、現代の映画は両方をシャープに保つより**ラックフォーカスで見せる順序を作る**ことが多い。
- `shallow depth of field` と `deep focus` は、AI動画プロンプトで効くと複数のガイドが挙げる語彙。確度は比較的高い。

---

## 5. シネマレンズ的なルック

シネマレンズと写真用レンズの違いのうち、**映像として画面に見えるものだけを書く**。機材の物理仕様は書いても絵が変わらない。

| 特徴 | 画面に出るか | プロンプト化 |
|---|---|---|
| T値（透過率を含む実効絞り） | 出ない（露出の一貫性の話） | 書かない |
| フォーカスブリージング抑制 | ほぼ出ない（プロンプトでの再現は困難とされる） | 書かない |
| パーフォーカル（ズームしてもピントが保たれる） | わずかに出る | `smooth zoom that holds focus throughout` |
| 長いフォーカススロー | わずかに出る | `slow, deliberate focus pull` |
| ギアのピッチ・前玉外径・マットボックス | 出ない | 書かない |

### アナモルフィック

横方向を圧縮して撮り、後で横に伸ばして超ワイドの画面を作るレンズ。スクイーズ比は 1.33x / 1.5x / 1.8x / 2x が一般的。

- **見え方**：楕円ボケ（非合焦部が縦に伸びる）、強い光源に対する**横一直線の青いフレア**、超ワイドなアスペクト比、浅く見える深度。比が高いほど楕円と横フレアが強くなる。
- **プロンプト語**：`anamorphic`, `oval bokeh`, `horizontal blue lens flares`, `anamorphic streak flare`, `ultra-wide 2.39:1 frame`
- ワイドスクリーンの大作感が欲しいときは **`anamorphic` の一語を足す**のが効くとされる。
- 比率の数値（`2x squeeze`）が効く証拠はない。**数値ではなく見え方の言葉で書く。**
- 参考：4:3 のゲートに 1.8x をかけると約2.40:1、16:9 に 1.33x をかけると約2.36:1（計算値）。2x は元々4-perf 35mmフィルムで2.39:1相当を作るための設計。

### ヴィンテージレンズ

- **見え方**：低〜中コントラスト、彩度が低め、開放での柔らかさとグロー、逆光でのフレア／ゴースト、ぐるぐるボケ、滑らかなフォーカス落ち、肌の階調が優しい。コーティング技術が未発達だったことに由来する。
- **プロンプト語**：`vintage cine lens look`, `low contrast, veiling glow around highlights`, `soft focus falloff wide open`, `warm flare blooming from a backlight`, `swirly bokeh`, `uncoated-lens haze`
- **レンズの固有名詞が Seedance に効く証拠はない。** 固有名詞を使う場合は、必ず見え方の記述に言い換えて併記する。

---

## 6. 効き方の整理

| 表現 | 判定 |
|---|---|
| `shallow depth of field` / `deep focus` | 根拠あり（複数のガイドが有効語として挙げる） |
| `wide-angle` / `telephoto compression` / `macro lens` / `soft focus` | 根拠あり |
| `anamorphic` / `anamorphic flares` / `bokeh` | 根拠あり（中） |
| `35mm lens` / `85mm portrait lens` などの焦点距離 | モデル依存・記述が矛盾。効果語と併記する |
| `f/1.4` `ISO 800` `24fps` などの裸の数値 | 効かない可能性が高い |
| `T2.8` / `1.33x squeeze` などの専門的な数値 | 未確認。使わない |
| レンズの製品名 | 未確認。見え方の記述を併記する |
| `focus breathing` の抑制 | プロンプトでは再現困難 |
| `parfocal` / ギアのピッチ / マットボックス | 画面に出ない。書かない |

**積層のしかた**：末尾に `shallow depth of field, subtle 35mm film grain, anamorphic flares, teal and orange grade` のように並べると、単一のフィルターではなく層になったルックとして効くとされる。

---

## 7. 用語対訳表

### 焦点距離・画角

| 日本語 | English |
|---|---|
| 焦点距離 | focal length |
| 画角 | angle of view / field of view |
| 対角／水平／垂直画角 | diagonal / horizontal / vertical angle of view |
| 35mm判換算 | 35mm equivalent |
| クロップファクター／換算倍率 | crop factor |
| イメージサークル | image circle |
| 超広角／広角 | ultra-wide-angle / wide-angle |
| 標準レンズ | normal lens / standard lens |
| 中望遠 | short telephoto |
| 望遠／超望遠 | telephoto / super-telephoto |
| 単焦点／ズーム | prime lens / zoom lens |
| 魚眼 | fisheye |
| マクロ（接写） | macro |

### 遠近感・歪み

| 日本語 | English |
|---|---|
| 遠近感／パースペクティブ | perspective |
| 遠近感の誇張 | exaggerated perspective |
| 圧縮効果 | telephoto compression / compressed perspective |
| 歪曲収差 | distortion |
| 樽型／糸巻き型歪曲 | barrel / pincushion distortion |
| 撮影距離 | camera-to-subject distance |
| 空間の平坦化 | flattening of space |

### 深度・ボケ

| 日本語 | English |
|---|---|
| 被写界深度 | depth of field |
| 浅い／深い被写界深度 | shallow / deep depth of field |
| ディープフォーカス（全焦点） | deep focus |
| 絞り／F値 | aperture / f-stop |
| T値 | T-stop |
| 開放／絞り込む | wide open / stop down |
| ボケ／ボケ味 | bokeh |
| 玉ボケ | bokeh balls / out-of-focus highlights |
| 前ボケ／後ボケ | foreground / background bokeh |
| ぐるぐるボケ | swirly bokeh |
| 被写体の分離 | subject separation / isolation |
| ピント面 | plane of focus |
| ラックフォーカス／フォーカス送り | rack focus / focus pull |
| 過焦点距離 | hyperfocal distance |

### シネマレンズ

| 日本語 | English |
|---|---|
| シネマレンズ／シネレンズ | cinema lens / cine lens |
| 写真用（スチル）レンズ | photo lens / still lens |
| フォーカスブリージング | focus breathing |
| パーフォーカル（同焦点） | parfocal |
| バリフォーカル | varifocal |
| フォーカススロー | focus throw |
| フォローフォーカス | follow focus |
| マットボックス | matte box |
| 球面（スフェリカル） | spherical |
| アナモルフィック | anamorphic |
| スクイーズ比／デスクイーズ | squeeze factor / desqueeze |
| 楕円ボケ | oval bokeh |
| 横長フレア | horizontal / streak flare |
| ヴェーリンググレア | veiling glare |
| ゴースト | ghosting |
| オールドレンズ／ヴィンテージレンズ | vintage lens |
| フィルムグレイン | film grain |
| アスペクト比／オープンゲート | aspect ratio / open gate |

---

## 8. ショット記述のテンプレート

```text
〈ショットサイズ〉、〈レンズの記述〉、〈カメラの動き＋速度〉、
〈被写体＋動作〉、〈環境＋光〉、〈フレーミングの指定〉、〈色調〉
```

例。

```text
Medium close-up、短めの望遠による圧縮と浅い被写界深度、歩く速さでのゆっくりしたドリーイン。
雨に濡れた窓へ向き直る女性、薄暗い部屋、背後の実光源のランプが髪を縁取る。
被写体は画面左1/3に置き、頭上に少しヘッドルームを残す。彩度を落とした寒色の階調に暖色のハイライト。
```

## 9. 注意事項

- 本ファイルの光学の記述（画角の公式、区分、シネマレンズの仕様、アナモルフィックのスクイーズ比、ヴィンテージレンズの描写）は、公開されている解説と物理の公式に基づく一般的な撮影知識であり、**Seedance の公式資料には含まれない**。
- 画角表とクロップファクターは公式から計算した値で、50mm 行を公開されている実測表と突き合わせている。それ以外の行を個別に実測表と照合してはいないため、四捨五入で±0.1°程度ずれることがある。
- **どの語彙が Seedance 2.5 に効くかは §6 の判定に従い、断定を避ける。** ユーザーが結果に不満なときは、数値を増やすのではなく「見え方の言葉」を具体化する方向で直す。
