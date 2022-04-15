---
marp: true
title: Marp + GitHub Actions で軽快スライド作り
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
    display: block;
    margin: auto;
}
a {
    text-decoration: none;
}
code {
    padding-right: 1ex;
    padding-left: 1ex;
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

Markdown という書き方で、スライドを作成できるツールです。

```markdown
---
marp: true
title : プレゼンテーションのタイトル
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

　 GitHub のアカウントをお持ちの方なら、次のリンクから
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

ブラウザ上で編集できます

![h:400](https://user-images.githubusercontent.com/10688301/163552518-08e1d667-deeb-41ff-97ac-a9c2c52f71de.png)

---

# 拡張機能を使う

`Marp` 拡張機能を有効にしておくと、プレビューが出ます

![h:400 float:left](https://user-images.githubusercontent.com/10688301/163552333-da379ede-3e31-4348-8ee8-dff11591c539.png)

---

# プレゼン作成のストレスがなくなります

- レイアウト不要
- それなりの見た目
- コピペ簡単
- 複数ファイルをまたいだ検索もできる


ここまでは Marp のご紹介でした。
続いて、作ったスライドの公開を自動化しましょう！

---

# 公開の自動化

テンプレートには最初から自動化の仕組みが入っています。

![h:400](https://user-images.githubusercontent.com/10688301/163553828-59b2513d-9ea2-4075-83cc-9b4cd841adcf.png)

---

# 公開の自動化

スライドの中に次のように書くことで、公開サイトに表示されます。

ルール： 冒頭の `marp: true` の次の行に、
```
title:
```
につづけてスライドのタイトルを入力してください。

例：

```yaml
title: - cluster 広島LT大会 #4
```

---

# 公開の自動化

ファイルを更新したら、変更内容を入れて「コミット」（チェックマーク）しましょう。数分で、先ほどのサイトが自動的に更新されます。

![](https://user-images.githubusercontent.com/10688301/163554227-2963ab9a-3c05-4ab3-91d7-1fdcaadfc95f.png)

---

# スライド編集もオンライン化して快適に！

詳しい紹介記事：
（あとで書く）

テンプレート：
[plageoj/presentation-template](https://github.com/plageoj/presentation-template)

実際の公開サイト：
[plageoj.github.io/presentations](https://plageoj.github.io/presentations/)
