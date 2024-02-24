---
marp: true
theme: gaia
paginate: true
_paginate: false
title: オフショアチームでいきなりスクラムマスターをやることになった
header: オフショアチームでいきなりスクラムマスターをやることになった
_header: ""
footer: ぺんた（@plageoj）
_class: lead
---

<style>
* {
    font-family: "M PLUS 1";
}
h1,h2,h3,h4,h5,h6 {
    font-weight: normal;
}
p, li {
    margin-bottom: 0.8rem;
    line-height: 1.5rem;
    font-size: 1.2rem;
}
a {
    text-decoration: none;
}
img {
    vertical-align: middle;
}
</style>

# オフショアチームで<br>いきなり**スクラムマスター**を<br>やることになった

JBUG広島 #13
ぺんた（@plageoj）

---

## 2023年4月、ついに就職しました

![](https://www.fabercompany.co.jp/_sys/wp-content/uploads/logo.png)

![](https://www.fabercompany.co.jp/_sys/wp-content/uploads/logo-mieruca_seo.svg) ![](https://www.fabercompany.co.jp/_sys/wp-content/uploads/logo-mieruca_heatmap.svg)

B2B の Web アプリケーションの保守運用をやっています。

<!--
日本側に5人、ベトナムに20人の構成
やりとりは英語
-->

---

<!-- _class: lead -->

## 3ヶ月後

---

## 2023年7月、いきなりスクラムマスターに

<style>
img.round{border-radius: 100%; margin-right: 1rex;}
</style>

<img src="https://www.fabercompany.co.jp/recruit/wp-content/uploads/2022/09/thu-member-kaneko.jpg" width="150" class="round"> ＜ スクラムマスターやってみない？

<img src="https://i.imgur.com/two5WpM.jpeg" width="150" class="round"> ＜ やります！

**帰宅して Atlassian のブログを読みまくる毎日！**

---

## 当初の課題感

- プロダクトオーナーが忙しすぎ
    優先度の設定が間に合わず、単一障害点に

- サイレントリリース問題

    カスタマーサクセスが知らない機能がいつの間にか
    リリースされている

- ベトナムチームが自発的に始めた改善タスクが
    管理不能に

---

<!--
_class: lead invert
-->

## Keep your issues up to date!

<!--
状況をいちいち問い合わせなくて済むようにしてほしい
-->

---

## 2023年10月、Notion から Backlog へ移行

- 検索が残念だった
- 数千のチケットを捌ききれない
    - 定期的にプロジェクトボードを分割していた
    - そして行方不明になる課題
- 強力なスタイリング
    だがプロジェクト管理には必要なかった

- スペルチェッカが効かない

---

## プロジェクトを分離

| プロジェクト | 用途 |
|:----|:------|
| リクエストボード | 開発要望、不具合報告 |
| 開発ボード | 開発・調査タスク |

- 開発ボードは親子課題を活用
- 開発ボードに向こう3週間をこえるタスクを積まない
 （ようにしたい）

<!--
二つのプロジェクトがあり適宜転記している

開発チーム用のボードを分けたつもりだったが
ベトナムがわも自力で翻訳して見てくれてる

定期的に開発ボードの未着手課題をリクエストボードに書き戻す
-->

---

### ベトナムメンバーから

- フィルタ機能が強力でいい

- 期日超過の課題が燃えるのが分かりやすい :fire:
    - 期限日の更新は理由をコメントするルールに

===

- GitHub 連携がほしい

<!--
空チケットとどう戦うか
-->

---

## 当初の課題感がどうなったか

- プロダクトオーナーが忙しすぎ
    → バグ対応と開発要望を分離。実時間を計測。

- サイレントリリース問題
    → スプリントレビューの運用を頑張る

- ベトナムチームが自発的に始めた改善タスクが
    管理不能に
    → どうすんの？？

---

## まとめ

- 課題を最新に保つ

- 不確定性を抑え込む

- 真っ白課題とどう戦うか？

### 次回：ベトナムに行ってきた
