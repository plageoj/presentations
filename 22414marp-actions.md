---
marp: true
title: Marp + GitHub Actions で軽快スライド作り - cluster 広島LT大会 #4
footer: Marp + GitHub Actions で軽快スライド作り - cluster 広島LT大会 #4
_footer: ""
theme: gaia
paginate: true
_paginate: false
backgroundImage: url('https://marp.app/assets/hero-background.svg')
---

<style>
*{
    font-feature-settings: "palt";
}
h1 {
    font-size: 1.3em;
    line-height: 1em;
}
li {
    line-height: 1.6em;
}
p {
    margin-top: 1em;
    line-height: 1.25em;
}
img {
    vertical-align: middle;
}
a {
    text-decoration: none;
}
</style>

<!--
_class: invert
-->

# 呉娑々宇山

府中町北部にある山。

標高 682m
読みは「ごさそうざん」

岩場が多いため装備が必要ですが
途中の高尾山までなら気軽に
登山できます。

![bg cover](https://pbs.twimg.com/media/C7RImESVoAADneA?format=jpg&name=4096x4096)

---

<!--
_class: lead
-->

# Marp + GitHub Actions で軽快スライド作り

（同）Team IshiHara
菅原 政行（[@plageoj](https://twitter.com/plageoj)）

---

#### コワーキングスペース
#### 始めました

JR 向洋駅南口すぐ！


「向洋 コワーキング」で検索ください

営業時間外の貸切も
承っております。

![bg right:59% contain](https://lh3.googleusercontent.com/y1sjVbAtoHnIAK8aZUunYKr9OtnbJhRCrtdGZoLlI4TucB7pipg9pq60OYo_JSKuetlkj25DQ3wf0EttyJ2O8WK45VSMt7i5cGNVUPIbUcsRWWnPeGDY2z7PsbLWH5EI1w=w1280)

---

# プレゼンスライド作成、こんなことがありませんか？

- テキストボックスのレイアウトが地味にたいぎい
- 毎回の「資料を PDF にして共有してください」対応が大変
- 昔に喋ったネタを発掘したいが、どのファイルにあるか忘れた
- 参加したイベント、発表したスライドを一覧にしたい
- `プレゼン_yymmdd_最新版_最終_更新.pptx` が辛い

**→ 一気に解決してしまいましょう！**

---

# [Marp](https://marp.app/) ?

![height:60px](./md.svg) Markdown という書き方で、スライドを作成できるツールです。

```markdown
---
marp: true
title: プレゼンテーションのタイトル
---
# これがスライドのタイトル
そして本文を書きます。[リンク](https://marp.app/) や *斜体*、**太字** も使えます。
+ 箇条書きもできます。

↓ マイナス記号3つでページ区切り

---
```

---

# [GitHub](https://github.com/) ?

日経新聞に「設計図共有サイト」と書かれたこともありましたが
今回は「スライド編集＆共有サイト」として使います。

![h:370](https://user-images.githubusercontent.com/10688301/163551204-bf39272f-9a9a-423d-b16e-e2b1b91c2cb5.png)

---

# エンジニアじゃないんだけど…

→ **テンプレートをご用意しました！**

　 次のリンクからコピーしてそのままファイルを追加するだけで、
　 すぐにスライド作成をできるようにしてあります。

[plageoj/presentation-template](https://github.com/plageoj/presentation-template)

資料はイベント終了後に Connpass で公開しますので
リンク先を Connpass の方からご覧ください。

---

# 過去のスライドが全て一覧に

![h:400](https://user-images.githubusercontent.com/10688301/163551719-dc6b42cb-05ed-4bc3-ba75-da7fb730ef82.png)

この画面で `.` (小数点) を押すと…

---

# オンラインで編集

オンライン上で編集できます

---

# 拡張機能を使う

`Marp` 拡張機能を有効にしておくと、プレビューを表示できます