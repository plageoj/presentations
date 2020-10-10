---
marp: true
paginate: true
_paginate: false
theme: gaia
header: Twitter をしよう！
_header: ""
title: Twitter をしよう！ - サマーインターンの前にツヨツヨになっちゃおうの会
footer: ぺんた ([@plageoj](https://twitter.com/plageoj))・広島大学工学部
_footer: ""
_class: lead
---

<style>
*{
    font-family: "BIZ UDPGothic", sans-serif;
    font-size: 1.05em;
}

img {
    vertical-align: middle
}

a {
    text-decoration: none;
}
</style>

# Twitter をしよう！

ぺんた [@plageoj](https://twitter.com/plageoj)

---

# `$ whoami`

## ぺんた

@plageoj 　[Twitter](https://twitter.com/plageoj) / [GitHub](https://github.com/plagej) / [Facebook](https://fb.me/plageoj) / [Qiita](https://qiita.com/plageoj)

広島大学工学部 3 年です。
専門は電子系。 趣味は情報系。

一部界隈では[8bit マシンで Twitter をやる](https://protopedia.net/prototype/95192c98732387165bf8e396c0f2dad2)人として
知られています。

---

# TL;DR

8bit マシンで Twitter の検索・投稿ができるようになるまでの
努力と涙と徹夜の記録です。

- OSI 参照モデル５～７層
- ちょっとした電子工作
- 基本的なコンピュータ構成の知識

Twitter で就活垢を作って云々という話はしません。

---

# ことはじめ

![bg right:60% h:100%](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/896ce082-3f33-6897-6d73-a90863361fda.png)

かっこええやん、、、

[出典 Tweet](https://twitter.com/peter6409/status/1158689521619230720)

---

# ターゲットマシン

![h:360](http://www.jibunde.com/pokecom/gazo/max/PC-G850VS_front.jpg)

（たぶん）世界最後の 8bit パソコン、PC-G850VS を使います。

---

## スペック

|            |                                        |
| :--------- | :------------------------------------- |
| CPU        | Z80 相当 CMOS 互換品 @ 8MHz            |
| メモリ     | RAM 32KB （約 30KB が使用可能）        |
| ストレージ | RAM と共通。増設不可                   |
| 画面       | 144x48 ドット / 24x6 文字 モノクロ液晶 |
| 対応言語   | BASIC、C、CASL、Z80 アセンブリ         |

高クロックとグラフィック性能が光ります。電池4本で70時間駆動！

---

# 実装の方針

さすがにポケコン単体で TCP/IP を実装するのはつらいので、
外部に通信用のコンピュータを接続して、そこで API との通信を
おこない、結果をポケコンに転送＆表示することにします。

![w:930](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/714ff0e4-ecce-629b-60d0-51b07dede586.png)

---

# 通信用コンピュータ

ESP32 を使います。
AliEx で 700 円位で売ってる古いリビジョンで十分です。

Rapberry Pi なんかの Linux ボードが使えれば楽ですが、サイズと通信規格の問題で採用できませんでした。

![bg right:43% 97%](https://images-na.ssl-images-amazon.com/images/I/61m9Wq0%2BgBL._SL1000_.jpg)

---

# ポケコン - ESP32 間通信

[ポケコン内蔵の Z80 SIO が使えます。](https://qiita.com/plageoj/items/681f3331746871c5f2f8)

一般的な UART と論理が反対ですが、ESP で
ソフトウェア的に対応ができます。

ソフトウェアで対処できないときは、NOT ゲート
を 2 個使って、回路で対応しましょう。

最低 3 本線をつなげば、動作できます。
良い子の皆さんは保護回路を入れてください…

![bg right:26% 70%](./20718strong-cv-a/inverter.svg)

---

# ポケコン側プログラム

BASIC で書くのですが、エラーハンドリングの方法がないので、
**完全にエラーが発生しない**ように書かなくてはいけません。

1. バッファをオーバーフローさせない
1. バッファが空のときは読み出さない
1. 通信エラーは起こさない（！）

上記を常に意識していないと、プログラム全体の実行が止まります。

---

# 漢字を出す

**漢字は出ません**。

[8x8 ドットの漢字フォントを ESP32 のフラッシュメモリに載せて](https://www.mgo-tec.com/blog-entry-spiffs-esp-wroom-32-misaki-font.html)、ビットマップとして転送＆描画することにしましょう。

高価なフォントデータは旧来 ROM として別売品で売られることが
多かったので、もはや ROM でなくなった現在も _漢字 ROM_ と
よびます。大して役に立たない知識ではあります……

---

# ひらがなを出す

実は**ひらがなも出ません。**

[高校生のころ手打ちしたひらがなフォントデータ](https://qiita.com/plageoj/items/a7c2598261d50e6034d5) があるので、これを流用しましょう。

漢字同様、ビットマップとして描画することになりますが、フォントデータは 600B ほどなのでポケコンに内蔵できます。

![bg right:20% 150%](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/903905c4-c3be-6e2f-1cda-b1067d516fdc.png)

---

# 漢字を入力する

漢字が出ないなら、当然入力もできません。

IME を自力開発する余裕はないので、巨人の肩に乗りましょう。

[Google 日本語入力の API](https://www.google.co.jp/ime/cgiapi.html)があるので、ここを叩いてあげれば
よさそうです。

しかしポケコンで入力するのは SJIS の半角ｶﾀｶﾅ。
API に投げるには UTF-8 の全角ひらがなでなくてはいけません。

---

<!--
_class: lead
-->

# 自作

### ～ないものは作る～

![bg opacity:.2](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/025715f2-015f-2154-445e-d3012dd55426.png)

---

# UTF-8 についてざっくりと

ASCII 由来の半角英数字と一部記号（0x00 ～ 0x7F）については、
UTF-8 と SJIS はコンパチです。

が、それ以降はマルチバイトで文字を表します。

具体的には、日本語なら 1 文字あたり 3 バイト。
絵文字だと 4 バイトになります。

気になった人は[コード表](http://orange-factory.com/dnf/utf-8.html)を見てみよう！

---

# SJIS についてざっくりと

ASCII との互換、半角ｶﾀｶﾅの JIS（旧規格）との互換を保ちつつ、

使われていなかった領域（0x80 ～ 0x9F、0xE0 ～ 0xFF）を
使って、半角文字は 1 バイト、全角文字は 2 バイトで表す方式です。

ポケコンの文字コードは、「漢字の出せない JIS」といったところ。
漢字領域を使うと文字化けしますが、その他については SJIS と
互換します。

---

# くらべると

|          |  ポケコン  |    SJIS    |   UTF-8    |
| :------: | :--------: | :--------: | :--------: |
| 半角英数 | ASCII 準拠 | ASCII 準拠 | ASCII 準拠 |
|  半角ｶﾅ  | SJIS 互換  |  1 バイト  |  3 バイト  |
| 半角かな | 半角ｶﾅ使用 |     -      |     -      |
|   全角   |     -      |  2 バイト  |  3 バイト  |

---

<!-- _class: lead -->

# `iconv` は偉大！

結局、UTF-8 全角 →SJIS 全角は OSS のものを流用。
そのほかは変換テーブルを自作しました。

PHP だと 1 行で書けるのに（ブツブツ……）

---

# 出力するには……

例： 「漢字カナ混じりの文字列を転送」

| モード |  G   |  T  |  G  |  H   |   G    |  H  |  G   |   T   |
| :----: | :--: | :-: | :-: | :--: | :----: | :-: | :--: | :---: |
| データ | 漢字 | ｶﾅ  | 混  | ｼﾞﾘﾉ | 文字列 |  ｦ  | 転送 | `END` |

- G ……16 進数文字列を送信。ビットマップとして描画。
- T ……テキストを送信。そのまま出力。コマンドもこのモード。
- H ……テキストを送信。ひらがなで出力。

---

# ポケコン側は……

| モード |  G   |  T  |  G  |  H   |   G    |  H  |  G   |   T   |
| :----: | :--: | :-: | :-: | :--: | :----: | :-: | :--: | :---: |
| データ | 漢字 | ｶﾅ  | 混  | ｼﾞﾘﾉ | 文字列 |  ｦ  | 転送 | `END` |

この入力を受け取り、モードを切り替えながら、
画面の左上から順に、出力位置が破綻しないように描画します。

失敗すると漢字がぶつ切りになったり、漢字の表示途中で改行したり
半角文字を漢字で上書きしてしまったりします。

---

<!--
_class: lead
-->

# すでにお腹いっぱいかもしれませんが

# これから Twitter と通信します

---

# PlatformIO はいいぞ

ESP32 のプログラムには Arduino C++を使いますが、さすがに
規模が大きすぎて、Arduino IDE で開発するとつらいです。

そこでおすすめなのが[PlatformIO](https://platformio.org/)！

純粋な C++で開発ができ、VSCode で拡張機能を使うとゴリゴリに IntelliSense がききます。
組み込みマイコン開発の強い味方です。

参考：[マイコン開発するなら PlatformIO がめちゃくちゃいいぞ](https://qiita.com/JotaroS/items/1930f156aab953194c9a)

![bg h:90% opacity:.3](https://cdn.platformio.org/images/platformio-logo.17fdc3bc.png)

---

# OAuth を通す

Twitter に書き込むようなリクエストを発行するときは、OAuth
認証が必要です。普段はSDKを使うと気にしなくてよいところも、
もちろん自力実装です。

面倒なのが、[シグネチャの作成](https://developer.twitter.com/ja/docs/basics/authentication/guides/creating-a-signature)のために SHA1 が必要なこと。
組み込み用の `mbedtls` が動いてくれたので、これを使います。

参考：[Twitter API から Arduino – ESP32 を使ってトレンドツイートを取得してみた](https://www.mgo-tec.com/blog-entry-twitter-api-arduino-esp32-trend-get.html)

---

# 使用ライブラリとメモリのお話

ESP32 は、実に 320KB もの広大な RAM を持っていますが、
通信系の処理がかなり大変らしく、結構ギリギリになります。

その結果、既製品の HTTP ライブラリや JSON ライブラリを使うと
メモリが足りなくて動作しなくなってしまいました。

仕方ないので、最小限必要となる機能だけを実現する、省メモリな
ライブラリを自作します。

---

# HTTPS を喋る

ESP32 の `WiFiClientSecure` で、SSL 接続ができます。
その後の HTTP は自力で喋ります。

自力で HTTP を喋るの、そこそこ楽しいです。
![](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/f1d42710-2d9e-97eb-0779-04e480d50505.png)

---

# レスポンスをパースする

Twitter API からのレスポンスは JSON で返ってきます。

が、JSON はファイルの末尾まで読まないと構造が確定できず、
パースする前に全部メモリ上に読み込まないといけません。

そんなことをするメモリはないので、送られてきた JSON を逐次
解析しながら、不要な部分は捨ててしまうようにします。

---

# パースしたレスポンスを転送する

前半でお話しした漢字転送プロトコルでレスポンスを転送すると……

![h:280](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/6e1716d1-01a7-b273-32c8-2c7e9f367b1e.png)

実際の描画速度が見たい方は [動画](https://www.youtube.com/watch?v=KMJp6iaADD4) をどうぞ。

---

# 所見

- Twitter ができるようになるまで 2 年かかった
- Twitter ができるってすごい

- 漢字が出ることのありがたみ
- 一生 Unicode についていきます
- コンピュータの歴史を切り開いた先人に感謝
- Twitterをやると情報通信技術のアレコレに触れられる

---

# 今後

姉妹品にご期待
ください
（出るのか？）

![bg right:65% 95%](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/9d88dc95-664b-e5dd-42fd-cda98614bb4f.png)

---

<!--
_class: lead
-->

# おまけ

今回、ESP32 から Twitter に直接アクセスしました。
ご想像のとおり、SDKを使わないのは茨の道でしかないです。

ただ ESP32 から Tweet したいだけなら、
SDK で踏み台を作って、HTTP か何かで叩くのがよいでしょう。

勉強のために作るとものすごくためになると思いますが、
**間違っても本番環境・実プロダクトで真似しないでくださいね！**

---

<!--
_class: lead
-->

# 君もポケ○ン、ゲットだぜ！

#### 詳しくは……

Qiita: [ポケットコンピュータPC-G850VSからTweetする](https://qiita.com/plageoj/items/aa472df1122147cce6be)
Note: [ポケコン哀歌、きみと一緒に歩いた一年。](https://note.com/plageoj/m/m6d536cd0c316) ……ポエム

GitHub: [plageoj/twitter-for-pc-g850](https://github.com/plageoj/twitter-for-pc-g850) …ESP32側
Gist: [plageoj/N.F & plageoj/TW.BAS](https://gist.github.com/plageoj/075a75bcc3708cc6b8f04bbf33c79d75) …ポケコン側
