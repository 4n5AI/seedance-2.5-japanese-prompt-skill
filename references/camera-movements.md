# シネマトグラフィー・カメラワークガイド（42選）

出典：[AI Shot Studio: 42 Camera Movements for AI Video Prompts](https://aishotstudio.com/42-camera-movements-ai-prompts/)（2026-01-30更新）。

カメラの動きを日本語だけで「カメラが前に進む」と指示するよりも、**国際標準の映画用語（英語）＋対象や意図の日本語補足**というハイブリッド形式で記述するほうが、意図が正確に伝わります。

本書は、AI動画プロンプト向けに整理された42種類（全44パターン）のカメラワークを6大カテゴリに分類し、プロンプトへの組み込み構文と演出意図をまとめたものです。関連する参照：ショットサイズ・アングル・構図は [shot-composition.md](shot-composition.md)、レンズと被写界深度は [lens-and-focus.md](lens-and-focus.md)、光と色は [lighting-color.md](lighting-color.md)、複数ショットの連続性は [multi-shot-continuity.md](multi-shot-continuity.md)、Seedance 2.5 固有の記法は [prompt-syntax.md](prompt-syntax.md)。

---

## 0. 日本語の現場用語 → 英語キーワード 対応表（誤訳防止・最重要）

**モデルは英語の単語に反応する。日本語の現場語をそのまま英訳すると別の動きが出力される。** ユーザーが左列の語を使ったら、必ず中列の英語へ変換してからプロンプトへ書く。

| ユーザーが言う日本語 | プロンプトに書く英語 | 書いてはいけない英語 |
|---|---|---|
| トラックアップ／T.U／寄る（カメラが前進） | `dolly in` / `push in` | `track up`, `truck in`, `zoom in` |
| トラックバック／T.B／引く（カメラが後退） | `dolly out` / `pull out` | `track back`, `truck out`, `zoom out` |
| トラック（左右に平行移動） | `truck left` / `truck right` | `track left`（曖昧） |
| トラック（被写体を追う） | `tracking shot, camera follows the subject` | `truck` |
| ズームアップ | `zoom in` | **`zoom up`**（和製英語。英語では「急上昇」の意） |
| パンアップ／パンダウン | `tilt up` / `tilt down` | `pan up`, `pan down` |
| カメラを上げる（高さを変える） | `pedestal up`（小範囲）／`crane up`・`boom up`（大範囲） | `move up`（曖昧） |
| 傾ける（静止した斜め構図） | `dutch angle, tilted horizon` | `roll`（動きになる） |
| 傾ける（回転する動き） | `camera roll` / `barrel roll` | `dutch angle` |
| 主観／一人称（本人の身体は写らない） | `POV shot, first person` | `over-the-shoulder` |
| 肩越し（手前の肩が写る） | `over-the-shoulder shot` | `POV` |

**特に注意すべき2点。**

- **「トラックアップ／トラックバック」は日本の映像・アニメ業界で dolly in / dolly out の意味で定着している一方、英語の `truck` は「横移動」を指す。** ここを取り違えると出力が横移動になる。さらにアニメの現場では T.U が「画の2D拡大」を指すこともあるため、**空間移動（dolly）なのか画の拡大（zoom）なのかを必ず確定させる。**
- **「寄る」「近づく」だけでは、レンズ操作（zoom）か本体移動（dolly）か決まらない。** ズームはカメラ位置が変わらないため平面的な拡大に見え、ドリーは空間の奥行きが変化する。どちらの意図かをユーザーに確認するか、合理的な仮定を短く示す。

英語表記は「語彙を一致させる手段」であり、**日本語部分を英語へ置き換える必要はない。プロンプト全体は日本語で書いてよい。** 詳細は [prompt-syntax.md](prompt-syntax.md) の該当節を参照。

---

## 基本原則：AI動画におけるカメラ設計

1. **英語キーワード＋日本語補足のハイブリッド**:
   - 例：`Slow dolly in。カメラが被写体の正面に向かってゆっくり前進し、表情に寄る。`
   - 公式ガイドはカメラ用語を英語のまま（翻訳不要と明記して）列挙していると解説されており、英語表記＋日本語補足はその語彙と整合します。ただし「英語で書くと認識精度が飛躍的に上がる」という主張は Seedance 2.5 について検証された記述が見つかっていません。
2. **1ショット＝1主要カメラアクションの原則**:
   - 1つのショット（4〜10秒程度）に「急激なズーム」「旋回」「チルト」を同時に詰め込むと、被写体の崩れや空間の歪み（モーフィング）が発生しやすくなります。1ショットにつき主たるカメラの動きは1〜2つに絞ります。複数のカメラワークを1区間に指定すると、指示自体が無視されることもあります。
3. **被写体の運動とカメラの相対関係**:
   - 被写体が動いている場合、「カメラが被写体を正面から追いかける（Following）」のか「並走する（Tracking）」のか「カメラは静止して被写体が通り過ぎる（Static）」のかを明示します。
4. **速度語を必ず添える**:
   - `slowly` / `smoothly` / `gradually`（速い場合は `rapidly` / `fast`）を入れます。速度を書かないと想定より速く動き、被写体が崩れます。**原則は「ゆっくり」。**
5. **動きに意図を持たせる**:
   - 被写体の動作を追う動き（motivated）は自然に見え、観客は動き自体を意識しません。静止した被写体に寄る動き（unmotivated）は観客が動きに気づくため、意図的な演出として使います。どちらでもよいのですが、**無目的な動きは「何を見せたいのか」を不明にします。**
6. **止める選択も持つ**:
   - 画面が固定されていると、動いているものへ視線が集中します。表情・細かい所作・決定的な瞬間は `static shot`（固定）が最も強いことがあります。カメラを動かすことを目的にしません。

---

## 1. Dolly & Track（前後移動・並走・追従）

カメラ本体が台車（ドリー）やレールに乗って空間内を物理的に移動するショット。背景のパースペクティブ（遠近感）が自然に変化します。

| カメラワーク | 英語プロンプト構文 | 演出意図・活用シーン | Seedance 2.5プロンプト記述例 |
|---|---|---|---|
| **Slow Dolly In**<br>（スロードリーイン） | `Slow dolly in, camera moves slowly forward toward the subject.` | 親密さ、感情の高まり、緊張感の導入。人物の表情や重要な小道具へのフォーカス。 | `カメラ：Slow dolly in。机に向かう人物の正面へ向かってカメラがゆっくり前進し、バストアップから表情の寄りへ。` |
| **Slow Dolly Out**<br>（スロードリーアウト） | `Slow dolly out, camera moves slowly backwards away from the subject.` | 孤独感、結末、状況の全体像の提示、被写体が取り残される演出。 | `カメラ：Slow dolly out。立ち尽くす人物からカメラが静かに後退し、周囲の荒涼とした広大な風景を露わにする。` |
| **Fast Dolly In**<br>（ファストドリーイン） | `Fast dolly in, camera moves rapidly forward toward the subject, urgent motion.` | 切迫感、衝撃、緊急事態、急激な意識の集中。 | `カメラ：Fast dolly in。ドアの向こうを見る人物へ向かってカメラが急接近し、目元の緊迫した表情を捉える。` |
| **Leading Shot**<br>（リーディングショット / 後退追従） | `Leading shot, camera moves backward matching the subject's speed.` | 前進する被写体の表情を捉え続ける。歩行、ランニング、対話シーン。 | `カメラ：Leading shot。前進してくる人物の速度に合わせてカメラが後ろ向きに後退しながら、正面の表情を追い続ける。` |
| **Following Shot**<br>（フォロイングショット / 前進追従） | `Following shot, camera follows behind the subject matching speed.` | 被写体と同じ視界・旅路を共有する感覚。未知の場所への進入、没入感。 | `カメラ：Following shot。廊下を奥へと歩く人物の背後を、カメラが一定の距離を保ちながら前進して追尾する。` |
| **Side Tracking**<br>（サイドラッキング / 並走） | `Side tracking, camera trucks alongside the subject.` | 横方向のダイナミックな移動、旅情、進行のペース感。街並みや背景の流れの描写。 | `カメラ：Side tracking。歩道を早足で歩く人物の真横から、背景のネオンサインを流しながら平行移動で追従する。` |
| **Worm's Eye Tracking**<br>（地上超ローアングル追従） | `Worm's eye view, low angle tracking, camera moves along the ground looking up.` | 圧倒的な巨大感、足音の重み、緊迫した逃走、ドラマチックな威圧感。 | `カメラ：Worm's eye tracking。地面すれすれの超ローアングルから見上げ、濡れたアスファルトを踏みしめる靴と足元を追尾する。` |

---

## 2. Zoom & Lens Effect（光学ズーム・レンズ効果）

カメラ位置を変えずにレンズの焦点距離を変化させる、または特殊なレンズ特性を利用するショット。

| カメラワーク | 英語プロンプト構文 | 演出意図・活用シーン | Seedance 2.5プロンプト記述例 |
|---|---|---|---|
| **Smooth Optical Zoom In**<br>（スムース光学ズームイン） | `Smooth optical zoom in, lens magnifies subject, camera stays stationary.` | カメラ位置固定で被写体を引き寄せる。観察者視点、監視カメラ風、静かな注視。 | `カメラ：Smooth optical zoom in。カメラは固定のまま、窓辺に立つ人物へ向かって光学ズームで滑らかに寄る。` |
| **Smooth Optical Zoom Out**<br>（スムース光学ズームアウト） | `Smooth optical zoom out, lens widens, background becomes blurry.` | 被写体から広角へ引き、周囲の広がりや環境のスケールを見せる。 | `カメラ：Smooth optical zoom out。咲き誇る一輪の花から広角へズームアウトし、草原全体の広がりを映し出す。` |
| **Snap Zoom (Crash Zoom)**<br>（スナップズーム / 急ズーム） | `Snap zoom, crash zoom, rapid zoom directly into the eyes.` | 驚き、衝撃の発見、コメディ的な強調、70年代カンフー映画風演出。 | `カメラ：Snap zoom。物音に気づいて振り返る人物の目元へ、一瞬でガタつきなく急激にズームインする。` |
| **Vertigo Effect (Zolly)**<br>（めまい効果 / ドリーズーム） | `Vertigo effect, dolly zoom, camera moves backward while zooming in, background expands.` | 衝撃、恐怖、認識の崩壊、強いめまい。被写体のサイズを維持したまま背景の遠近感が急激に歪む。 | `カメラ：Vertigo effect (dolly zoom)。人物のサイズを固定したままカメラが後退しつつズームイン、背後の空間が不気味に歪み広がる。` |
| **Extreme Macro Zoom**<br>（極限マクロズーム） | `Extreme macro zoom, zoom transition from subject to micro details of surface.` | 肉眼を超えた超ミクロ世界への突入。瞳の虹彩、機械内部、皮膚、水滴。 | `カメラ：Extreme macro zoom。人物の瞳から虹彩の繊維状テクスチャ、微小な光の反射まで極限まで拡大して迫る。` |
| **Cosmic Hyper Zoom**<br>（コズミックハイパーズーム） | `Cosmic hyper zoom, fast zoom transition from extreme wide view down to macro level.` | 宇宙・地球規模から地上の一点へ、または逆方向の超長距離ワープ演出。 | `カメラ：Cosmic hyper zoom。夜の地球の衛星写真から超高速で急降下し、大都市の特定のビルの屋上へ着地する。` |
| **Fisheye Lens**<br>（魚眼レンズ / ピープホール） | `Fisheye lens, extreme wide-angle distortion, circular frame.` | 狂気、歪んだ心理、スケートボード動画、覗き穴（ドアスコープ）視点。 | `カメラ：Fisheye lens。超広角の円形魚眼レンズ特有の湾曲を伴い、正面からこちらを覗き込む人物を歪ませて捉える。` |

---

## 3. Pan, Tilt & Truck（角度変更・水平移動・構図）

カメラの三脚・軸を中心にレンズの向きを変える（Pan/Tilt）、またはレール上で横移動する（Truck）ショット。

| カメラワーク | 英語プロンプト構文 | 演出意図・活用シーン | Seedance 2.5プロンプト記述例 |
|---|---|---|---|
| **Tilt Up**<br>（チルトアップ） | `Tilt up, camera pivots vertically upward from bottom to top.` | 足元から全身・顔への視線移動、巨大建築や怪獣の威容、希望の上昇。 | `カメラ：Tilt up。足元の石畳からゆっくりとレンズを上へ向け、そびえ立つ古城の尖塔と青空を仰ぎ見る。` |
| **Tilt Down**<br>（チルトダウン） | `Tilt down, camera pivots vertically downward from top to bottom.` | 空から地上へ、落胆、崩壊、見下ろす視線、物語の開始（街の俯瞰から通りへ）。 | `カメラ：Tilt down。薄暮の曇り空からゆっくり見下ろし、雨で濡れた交差点を行き交う傘の波へパンダウンする。` |
| **Truck Left**<br>（トラックレフト / 左横移動）※日本語の「トラックアップ／バック」は前後移動を指す別語 | `Truck left, camera moves sideways on a track to the left.` | 被写体と直交する横方向への移動。横スクロール的な情景描写、群衆の横断。 | `カメラ：Truck left。書架の前に立つ人物を横に見ながら、カメラが左方向へ滑らかにスライド移動する。` |
| **Truck Right**<br>（トラックライト / 右横移動） | `Truck right, camera moves sideways on a track to the right.` | 物語の進行、時間の経過、パノラマ的な空間の開示。 | `カメラ：Truck right。実験室の作業台に並ぶ機材の列を右へ横移動しながら、奥で作業する研究者を捉える。` |
| **Whip Pan**<br>（ホイップパン / 高速パン） | `Whip pan, camera whips violently to the side with extreme directional motion blur.` | 激しい場面転換、予期せぬ闖入者への素早い振り向き、アクションの勢い。 | `カメラ：Whip pan。激しいモーションブラーを伴ってカメラが右へ高速で振り向き、爆発の煙を瞬時に捉える。` |
| **Dutch Angle (Roll)**<br>（ダッチアングル / 斜角） | `Dutch angle, camera roll, tilted sideways on Z-axis.` | 不穏、精神的不安定、混沌、悪役の登場、危険な事態。 | `カメラ：Dutch angle。カメラがZ軸に約25度傾いた斜めの構図で、薄暗い路地に佇む不気味な人物を捉える。` |
| **Over the Shoulder (OTS)**<br>（肩越しショット） | `Over the shoulder shot, camera mounted behind subject A framing subject B.` | 2者間の対話、対峙、視線の交錯、客観と主観の中間。 | `カメラ：Over the shoulder shot。手前の人物の肩と後頭部をボケ味でフレームに入れ、向かい合って話す相手の表情を映す。` |

---

## 4. Orbit & Rotation（旋回・アーク・回転）

被写体を中心として周囲を円弧状に回り込む、またはカメラ自体が回転するダイナミックなショット。

| カメラワーク | 英語プロンプト構文 | 演出意図・活用シーン | Seedance 2.5プロンプト記述例 |
|---|---|---|---|
| **Orbit 180**<br>（180度オービット / 半周旋回） | `Orbit 180, camera moves in a half-circle around the subject.` | 正面から横顔、背後へのドラマチックな視点転換。決意の表明、状況の把握。 | `カメラ：Orbit 180。立ち止まる人物の周囲を半円を描いて回り込み、正面の決意の表情から見つめる先の荒野へ視界を開く。` |
| **Fast 360 Orbit**<br>（高速360度オービット） | `Fast 360 orbit, camera spins rapidly 360 degrees around the subject.` | 混乱、変身シーン、クライマックス、覚醒、圧倒的なエネルギー。 | `カメラ：Fast 360 orbit。光を纏って浮遊する人物の周囲を、カメラが高速で360度回転しながら旋回する。` |
| **Slow Cinematic Arc**<br>（スローシネマティックアーク） | `Slow cinematic arc, camera moves in a wide curve to reveal side profile.` | 優雅さ、荘厳さ、ハイブランドCM風の高級感、静かな対決。 | `カメラ：Slow cinematic arc。台座に置かれた製品の斜め前から側面へ、優雅な弧を描いて滑らかに移動する。` |
| **Barrel Roll**<br>（バレルロール / 鏡筒回転） | `Barrel roll, camera spins 360 degrees clockwise while moving forward, disorienting.` | 航空機の飛行、無重力、夢の中、上下感覚の喪失、激しいアクション。 | `カメラ：Barrel roll。前進しながらカメラが時計回りに360度ダイナミックにロール回転し、天地が逆転する。` |
| **Bullet Time**<br>（バレットタイム / 時間停止旋回） | `Bullet time, frozen moment, ultra slow motion, camera orbit right.` | 時間が止まった超スローモーション空間の中でカメラだけが移動するマトリックス風演出。 | `カメラ：Bullet time。水滴が空中で静止した極限のスローモーションの中、カメラが右方向へ回り込んで静止した飛沫を映す。` |

---

## 5. Drone & Crane（昇降・高低差・空撮）

カメラを垂直方向に上下動させる（ペデスタル/クレーン）、または空中を飛行させて広大な空間を捉えるショット。

| カメラワーク | 英語プロンプト構文 | 演出意図・活用シーン | Seedance 2.5プロンプト記述例 |
|---|---|---|---|
| **Pedestal Up**<br>（ペデスタルアップ / 垂直上昇） | `Pedestal up, camera rises vertically straight up from waist to eye level.` | 角度を変えずに垂直に上がる。被写体の立ち上がり、隠れた要素の提示。 | `カメラ：Pedestal up。カメラの角度を水平に保ったまま垂直に上昇し、机の上の書類から人物の真剣な横顔へと高さを合わせる。` |
| **Pedestal Down**<br>（ペデスタルダウン / 垂直下降） | `Pedestal down, camera lowers vertically straight down.` | 立ち位置からしゃがみ込みへの追従、地面や床の痕跡への視線誘導。 | `カメラ：Pedestal down。立っている人物の目線から垂直に下降し、床に落ちた割れたガラスの破片へ高さを合わせる。` |
| **Crane Up**<br>（クレーンアップ / ハイアングル俯瞰展開） | `Crane up, camera lifts high into the air.` | 個人の物語から世界全体のスケールへの拡張、旅立ち、幕引き。 | `カメラ：Crane up。港に立つ人物のアップから、アームが大きく上空へせり上がり、停泊する巨大な船と港全体を俯瞰する。` |
| **Crane Down**<br>（クレーンダウン / 着地・接近） | `Crane down, camera descends slowly to the subject.` | 壮大な全体像から特定の人物やドラマへの没入、物語の開幕。 | `カメラ：Crane down。大都市のビル群の上空からゆっくりと下降し、ビルの屋上ベンチに座る一人の人物の横へ着地する。` |
| **Drone Fly Over**<br>（ドローンフライオーバー） | `Drone fly over, high altitude flight moving forward over the landscape.` | 大自然、大都市、道路、広大な地形の前進飛行。圧倒的なスケール感。 | `カメラ：Drone fly over。木々の梢すれすれの高高度をドローンが高速で前進飛行し、眼下に広がる針葉樹林と山脈を映す。` |
| **Epic Drone Reveal**<br>（エピックドローンリビール） | `Epic drone reveal, rising and tilting down to reveal the scene.` | 上昇しながら見下ろすことで、稜線や建物の向こうに隠れていた絶景を開示する。 | `カメラ：Epic drone reveal。岩山の尾根を越えながら急上昇し、チルトダウンして眼下に広がるエメラルドグリーンの湖を劇的に開示する。` |
| **Large Scale Drone Orbit**<br>（超広域ドローン旋回） | `Large scale drone orbit, massive sweeping circle around the landscape.` | 灯台、孤島、城、山頂のモニュメントなどを中心とした巨大な円周旋回。 | `カメラ：Large scale drone orbit。孤島に立つ白亜の灯台を中心軸として、ドローンが海上を大きく旋回しながら全景を捉える。` |
| **Top Down (God's Eye View)**<br>（トップダウン / 真俯瞰） | `Top down shot, camera pointing straight down, slow twist.` | 幾何学的な美しさ、神の視点、迷路、横断歩道、ベッドに横たわる人物。 | `カメラ：Top down shot。真上から地面へレンズを垂直に向けた真俯瞰構図。カメラがゆっくりと自転しながら交差点の横断歩道を捉える。` |
| **FPV Drone Aggressive**<br>（FPVドローン急降下） | `FPV drone dive, aggressive diving motion down a vertical structure.` | エクストリームスポーツ風の超絶アクロバット。ビル壁面の垂直ダイブ。 | `カメラ：FPV drone dive。超高層ビルの垂直なガラス壁面に沿ってカメラが真下へ急降下し、地上すれすれで水平飛行へ引き起こす。` |

---

## 6. POV, Focus & Transition（視点・フォーカス・場面転換）

被写体の主観（POV）、ピント移動による視線誘導、遮蔽物を利用したトランジション。

| カメラワーク | 英語プロンプト構文 | 演出意図・活用シーン | Seedance 2.5プロンプト記述例 |
|---|---|---|---|
| **POV Walk**<br>（主観歩行 / 一人称視点） | `POV walk, first person camera moving forward with bobbing motion.` | 体験の追体験、探索、ホラーゲーム風の没入、未知の扉を開ける緊張感。 | `カメラ：POV walk。人物の目線（一人称視点）で、歩行に伴う自然な揺れを伴いながら薄暗い洋館の廊下を前進する。` |
| **Handheld Documentary**<br>（手持ちドキュメンタリー風） | `Handheld camera, shaky motion, natural movement, documentary style.` | 生々しいリアリティ、現場感、ニュース取材風、即時性、生配信風。 | `カメラ：Handheld camera。手持ちカメラ特有の微小な手振れと自然なリフォーカスを伴い、厨房で調理するシェフの動きを追う。` |
| **Reveal from Behind (Wipe)**<br>（障害物越しのリビール） | `Wipe movement, camera slides laterally from behind foreground object to reveal the scene.` | 木や柱、壁の後ろからスライドして奥の景色や人物をドラマチックに見せる。 | `カメラ：Reveal from behind。手前にある巨大な木の幹の背後からカメラが右へスライドし、木陰の向こうで佇む人物を露わにする。` |
| **Fly Through**<br>（スルーショット / 貫通通過） | `Fly through, camera moves through an opening into the scene.` | 鍵穴、窓ガラス、フェンスの隙間、トンネルを通り抜けて別世界へ入る。 | `カメラ：Fly through。アンティーク調の窓枠の隙間をすり抜けるようにカメラが屋外から室内へスムーズに進入する。` |
| **Rack Focus**<br>（ラックフォーカス / ピント送り） | `Rack focus, focus shifts from the foreground object to the background subject.` | 視線誘導。手前の小道具（グラス、手紙など）から奥の人物へピントを切り替える。 | `カメラ：Rack focus。手前の雨粒がついた窓ガラスに合っていたピントが、ゆっくりと奥の通りを歩く人物へと移動して鮮明になる。` |
| **Reveal from Blur**<br>（ボケからのリビール） | `Rack focus, start completely out of focus, slowly pull focus until sharp.` | 意識の回復、目覚め、幻想的なオープニング、夢から現実への移行。 | `カメラ：Reveal from blur。画面全体が完全にぼやけた玉ボケ状態から始まり、徐々にピントが合って朝の光の中にいる人物の笑顔が浮かび上がる。` |
| **Hyperlapse**<br>（ハイパーラプス / 移動微速度撮影） | `Hyperlapse, camera moves forward rapidly, time accelerated, fast motion, light trails.` | 時間の超圧縮、都市の喧騒、光の軌跡、長距離の瞬間移動。 | `カメラ：Hyperlapse。夜の繁華街の歩道をカメラが早回しで前進。周囲の人々や車のヘッドライトが光の筋となって流れる。` |

---

## Seedance 2.5でのカメラ指示の組み合わせテクニック

### 1. 「カメラの高さ」と「アングル」の明示
高さ（ポジション）と角度（アングル）は別概念なので、2語で分けて書きます。距離感（ショットサイズ）とあわせた一覧は [shot-composition.md](shot-composition.md) を参照してください。

- 高さと角度：`Eye level`（目線）、`High angle`（見下ろし）、`Low angle`（見上げ）、`Ground level`（地面すれすれ）、`Top-down`（真俯瞰）
- 距離感：`Extreme close-up`（超接写）、`Close-up`（顔の寄り）、`Medium close-up`（胸上）、`Medium shot`（腰上）、`Full shot`（全身）、`Wide shot`（全景）
- **日本の現場略号（WS＝ウエストショット、BS、US、FF、D）はプロンプトに書きません。** `WS` は英語では Wide Shot（引き）で意味が反転します。詳細は [shot-composition.md](shot-composition.md) の対応表を参照。

### 2. 時間指定（秒数）とカメラワークの接続
複数秒にわたるショットの場合、時間ごとにカメラの動きを定義します。実撮影と同じく **「静 → 動 → 静」の三段構成**にすると安定します。

- `0〜2秒: Static camera（固定）で人物の静止した表情を捉える。`
- `2〜8秒: Slow dolly in（ゆっくり前進）を開始し、人物の瞳のアップへ寄る。`
- `8〜10秒: Rack focusで背景のドアを開ける人物へピントを送り、動きを止める。`

整数秒・隙間なし・1区間3秒以上といった時間指定の制約は [prompt-syntax.md](prompt-syntax.md) を参照してください。

### 3. 禁止・注意事項
- **1区間1主要カメラアクション**: 複数のカメラワークを1区間に指定すると、指示が無視されるか破綻します。動きは1つ、多くても方向が矛盾しない2つまでに絞ります。
- **急激な方向転換の連続**: 「右にパンした直後に左へホイップパンし、急降下する」といった物理的に無理な複合指示はモデルの空間認識を壊します。
- **矛盾する指示を重ねない**: `handheld`（手持ち）と `locked steady`（固定）を同時に指定しません。
- **速度語を省かない**: `slowly` / `smoothly` / `gradually` を添えます。原則は「ゆっくり」。
- **揺れは弱く限定する**: `shaky` や `violent handheld` を強く指定すると被写体の形状が崩れます。`subtle handheld, natural micro-movement` のように量を限定します。
- **ワンカット（連続撮影）とカット割り（シーン切り替え）の混同**: ワンカットを意図する場合は **`one-take shot`**（公式が解釈する語彙）と明記し、`continuous shot` / `no cuts` を添えてカットが自動挿入されないよう制約します。
- **複数ショットを出すとき**: 隣接ショットのサイズと角度を変え、人物の外見・画面上の左右の立ち位置・光源の方向を各ショットで反復します。詳細は [multi-shot-continuity.md](multi-shot-continuity.md) を参照。
