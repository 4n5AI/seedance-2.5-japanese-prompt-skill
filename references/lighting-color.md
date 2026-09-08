# ライティング・カラーガイド

光と色をプロンプトで言語化するための参照。ショットサイズと構図は [shot-composition.md](shot-composition.md)、レンズは [lens-and-focus.md](lens-and-focus.md)、カメラの動きは [camera-movements.md](camera-movements.md) を参照する。

用語の体系と日本語の記述は [CinematographyStoryboards](https://github.com/4n5AI/CinematographyStoryboards) の LIGHTING 軸に合わせ、人物ライティングのパターンとカラーグレードを補っている。

---

## 1. 三点照明とライティングパターン

| 日本語名 | 英語プロンプト表記 | 操作・比率 | 効果・印象 |
|---|---|---|---|
| 三点照明 | `three-point lighting` | キー／フィル／バックの3灯 | 深み、立体感、自然な見た目 |
| キーライト | `key light` | 主光源。被写体の斜め45度、高い位置 | 主たる明暗を決める |
| フィルライト | `fill light` | 光量はキーの1/3〜1/4程度 | キーが作った影を柔らかくする |
| バックライト | `back light` | 光量はキーの1/2以上 | 被写体を背景から分離する |
| レンブラントライト | `Rembrandt lighting` | 水平45度・高さ45度 | 頬に三角形のハイライト。重厚な人物像 |
| バタフライ／パラマウント | `butterfly lighting` / `Paramount lighting` | 正面斜め上から | 鼻の下に蝶形の影。顔を美しく引き立てる |
| スプリットライト | `split lighting` | 真横から | 顔を明暗半分に割る。ミステリアス |
| ループライト | `loop lighting` | キーをやや浅い角度に | 鼻の影が頬にループ状。自然な中間型 |
| リムライト／エッジライト | `rim light` / `edge light` | 背後・斜め後ろから | 輪郭に光の線。背景から分離、立体感 |
| 逆光・輪郭光 | `backlight` | 光源が被写体の後方 | 被写体は暗く背景は明るい。ドラマチック |
| シルエット | `silhouette` | 被写体を黒く落とす | 匿名性、詩的、抽象化。冒頭、象徴表現 |

**灯りの位置まで書くと効きやすい。** 三点照明はAI動画プロンプトでも実例が報告されている。

```text
three-point lighting, warm key light from camera left, soft fill from camera right,
subtle rim light separating the subject from the dark background
```

フィルとバックの光量比（キーの1/3〜1/4、1/2以上）は実撮影の一般的な目安であり、厳密な規格ではない。

---

## 2. 光の質・トーン・光源

| 日本語名 | 英語プロンプト表記 | 操作 | 効果・印象 | 使い所 |
|---|---|---|---|---|
| ハイキー | `high key lighting` | 明るく影が少ない | 清潔、幸福、広告的 | CM、コメディ、日常 |
| ローキー | `low key lighting` | 暗部主体・高コントラスト | 緊張、ミステリー | サスペンス、ノワール |
| 柔らかい光 | `soft light` / `diffused light` | 拡散光・影が淡い | 優しさ、美肌、癒し | ポートレート、恋愛 |
| 硬い光 | `hard light` / `direct sunlight` | 直射光・濃い影 | 力強さ、ドラマ、対比 | 真昼の緊張、ノワール |
| 曇天のディフューズ光 | `overcast diffused daylight` | 空全体が巨大なディフューザーになる | 影が極端に柔らかい。均質でフラット | ドキュメンタリー、静かな場面 |
| プラクティカル（実光源） | `practical light` | 画面内に見える光源（ランプ等） | リアリティ、生活感 | 夜の室内、バー |
| ネオン | `neon light` | ネオン・LEDの色光 | 都会的、近未来 | 夜の街、サイバー系 |
| 光芒／ボリュメトリック | `volumetric lighting` / `god rays` / `light shafts` | 霧や埃で光の筋が見える | 神秘、荘厳 | 森、窓からの光、教会 |
| ゴボ／シャドウパターン | `gobo shadow pattern` / `dappled light` | 型板越しの光で模様を落とす | 空間の質感、時間帯の示唆 | 木漏れ日、ブラインドの影 |
| 炎の光 | `firelight` / `candlelight` | 揺らめく暖色光源 | 温もり、親密さ | キャンプ、和室の夜 |

---

## 3. 時間帯

| 日本語名 | 英語プロンプト表記 | 目安 | 効果・印象 | 使い所 |
|---|---|---|---|---|
| ゴールデンアワー | `golden hour` | 太陽高度が概ね +6°〜−4°、日の出・日没前後 | 暖色、エモーショナル、映画的 | 恋愛、回想 |
| マジックアワー | `magic hour` | 太陽高度が概ね +6°〜−6°。ゴールデンとブルーの両方を含む総称 | 移り変わりの表現 | 夕暮れ、夜明け |
| ブルーアワー | `blue hour` | 太陽高度が概ね −4°〜−6°、日没後・夜明け前の20〜30分 | 静けさ、切なさ、幻想的 | 別れ、余韻、独白 |

**色温度だけでなく、光の方向と環境との相互作用まで書くと機能しやすい。**

```text
golden hour backlight from the right, long shadows across the floor, warm rim on the hair
```

太陽高度と時間の目安は資料によって区分が揺れる。厳密な定義としては扱わない。時間の長さは緯度と季節で変わる。

---

## 4. 色温度

| 光源 | 英語 | ケルビン |
|---|---|---|
| ローソクの炎 | `candlelight` | 1,000〜2,000K |
| 白熱電球（家庭用） | `warm incandescent` | 約2,700〜2,900K |
| タングステン（撮影用） | `tungsten` | 約3,200K |
| 蛍光灯 | `fluorescent` | 約3,000〜6,500K（電球色〜昼光色で幅がある） |
| 昼光・晴天の真昼 | `daylight` | 約5,600K |
| 曇天 | `overcast` | 6,500K以上 |

数値が低いほど暖色（赤・オレンジ寄り）、高いほど寒色（青寄り）。**混色は画面の映画的な印象に効くとされる**（窓から入る青い昼光と、室内のタングステンの暖色を同じ画面に置く、など）。

ケルビン値そのものがモデルに効くかは未確認。`warm tungsten interior against cool blue daylight from the window` のように**見え方の言葉で書く。**

---

## 5. カラーグレード・フィルムルック

| 日本語名 | 英語プロンプト表記 | 内容 |
|---|---|---|
| ティール＆オレンジ | `teal and orange color grade` | シャドウを青緑へ、肌をオレンジへ寄せる。肌が本来暖色なので、影を青緑に振ると自動的に色のコントラストが生まれ、人物が環境から分離する |
| 高コントラスト／低コントラスト | `high contrast` / `low contrast, flat` | 明暗の幅 |
| モノクローム | `black and white` / `monochrome` | 白黒 |
| フィルムグレイン | `organic film grain` | フィルム粒子の質感。奥行きと現実感を加える |
| ハレーション | `soft halation around the highlights` | ハイライト周囲のにじみ |
| ブリーチバイパス／銀残し | `bleach bypass` | 彩度を抑えコントラストを強めた引き締まった画 |
| 16mmフィルム調 | `16mm film look` | `organic film grain` ＋ `soft halation` ＋ `slight gate weave` ＋ `warm film-stock color` の4点を名指しすると成立しやすい |
| 80年代VHS | `1980s VHS aesthetic` | `tracking lines` / `chroma bleed` / `soft focus` / `washed-out color` / `tape warble` / `corner timestamp` |
| フィルムストック指定 | `shot on 〈銘柄〉` | 曖昧な `grainy` より具体的な語（銘柄、`vintage glass`、`chromatic aberration`）が効くとされる |

- **カメラの動きを書く部分に `film grain` を混ぜない。** モデルが「平滑化すべきノイズ」と解釈する場合があるという報告がある。ルック指定は「見た目」の項目にまとめる。
- ルックは**末尾に層として並べる**と効きやすい。例：`shallow depth of field, subtle film grain, anamorphic flares, teal and orange grade`

---

## 6. 注意事項

- 本ファイルの照明・色の知識は一般的な撮影知識であり、**Seedance の公式資料には含まれない**。
- 「どの語彙がAI動画モデルに効くか」の記述は第三者の検証報告に基づき、その多くは他モデルでの検証である。**Seedance 2.5 での検証ではない**ので、ユーザーへ断定して伝えない。
- 光量比・太陽高度・ケルビン値は一般的な目安。数値を断定せず、必要なら現行の資料で確認する。
