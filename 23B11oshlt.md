---
marp: true
theme: gaia
paginate: true
_paginate: false
title: ChatGPT で使える小さな呪文集
header: ChatGPT で使える小さな呪文集
_header: ""
footer: 菅原政行（@plageoj）
_class: lead
---

<style>
* {
    font-family: "M PLUS 1";
}
h1,h2,h3,h4,h5,h6 {
    font-weight: normal;
}
p {
    margin-bottom: 0.8rem;
    line-height: 1.5rem;
}
a {
    text-decoration: none;
}
</style>

# ChatGPT で使える小さな呪文集

菅原 政行

<small>株式会社Faber Company / 合同会社Team IshiHara</small>

---

## 東京と広島を行き来しているエンジニアです

![](https://www.fabercompany.co.jp/_sys/wp-content/uploads/logo.png)

4月から正社員になりました。デジタルマーケティングの会社の開発部門で働いています。

GitHub Copilot 導入は鋭意稟議中（早くやってくれ……）

---

<!-- _class: lead -->

## ChatGPT は英語の方が精度が高い(らしい)

### ⇅

## 我々は日本語の方が精度が高い

ご紹介する呪文集は全て GPT-3.5 Turbo で使えます。

---

## ChatGPT にプロンプトを生成させる

```
prompt for: <やりたいこと>
```

![w:900](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/b116c141-6a0a-223d-9cde-dd17b59c8cc7.png)

---

## そのまま実行する……

```
execute it
```

![w:900](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/118e0c3f-d9c7-e92a-119c-550b53c43b0c.png)

---

## さっき作ったプロンプト、日本語で何ていうの

```
prompt in: ja
```

![w:900](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/0a9b8d76-8200-7cd1-0561-191bfcce562d.png)

---

## 翻訳サービス等を使って英語で訊く……

![w:900](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/28ff84e2-24a4-32b5-72ef-843c6b394a88.png)

---

## 出力を日本語化

```
lang: ja
```

![w:900](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/1695a310-7912-0a9b-7645-a0c06d672ba7.png)

---

## おまけ: 説明を抑制する

```
w/o expl.
```

![w:900](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/7784fba7-3340-9abb-0888-fc6a6ec3591f.png)


---

# ざっくりまとめ

- 2語、3語でOK。文章として完成していなくていい

- ただし前置詞は適切に使う必要あり

- `lang:` では全体が翻訳され、 `in:` では一部だけ翻訳される傾向がある（なぜ？）
    - `in: flask` `in: laravel` なども使える。便利

---

### チートシート

| | |
|:--|:--|
| `prompt for: <話題>` | プロンプトを生成（そのあと調整できる） |
| `execute it` | プロンプトを解釈 |
| `(prompt) in: ja` | (プロンプトを)日本語化 |
| `lang: ja` | 出力を日本語化 |
| `w/o expl.` | 説明を抑制する |
| `more` | 続きを出力させる |
