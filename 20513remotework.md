---
marp: true
header: 「ファイル名を指定して実行」で居室からお湯を沸かす
title: 「ファイル名を指定して実行」で居室からお湯を沸かす
footer: リモートワークハックLT Vol.2 / ぺんた @plageoj
description:
theme: gaia
_class: lead
paginate: true
_paginate: false
backgroundImage: url('https://marp.app/assets/hero-background.jpg')
private: true
---

# 「ファイル名を指定して実行」で
# 居室からお湯を沸かす

ぺんた (@plageoj)

<style>
* {
    font-family: "游ゴシック", sans-serif;
    font-feature-settings: "palt";
}
p, li {
    font-family: "しっぽり明朝","游明朝",serif;
    font-size: 2.4rem;
    line-height: 1.7em;
}

li {
    line-height: 1.3em;
}
</style>

<!--
ぺんたと申します。よろしくおねがいします。
ひねりのないタイトルですが、最後までお聞きいただければ幸いです。
-->

---

# 自己紹介

Webエンジニア業で暮らしている大学生です。
大学も、 前期の講義がすべて自宅受講:house:になりました。

ポケコンで Twitter する人です。

Twitter:    [@plageoj](//twitter.com/plageoj)
Facebook:   fb.me/plageoj

<!--
普段はポケコンを触ったりWebエンジニアをしたりしながら暮らしている大学生です。
もともと開発業務は9割以上リモートで行っていたのですが、
コロナをうけ、大学の方も、夏までリモート講義になりました。
リモートワークをやっていると思うのが、
-->

---

## リモートワークに、お湯

+ 高まるコーヒー需要:coffee:
+ 寒い家 & 末端冷え

…指先が冷えるとタイプに障るので、 氷枕にお湯を入れて、 手首を
温めています。
（耐熱温度・低温やけどに注意！）

![bg right:45%](https://images.medpex.de/medias/44405/anyqxjCbIgF97DeVnFIVka-30.jpg)

<!--
やたらとコーヒーを飲みたくなるということなんですよね。
朝晩はまだ冷え込むので、指先が冷えてタイピングのスピードが落ちることもあり、
普段に比べると多くのお湯を消費しながらリモートワークをしています。
-->

---

# リモートワーク × お湯あるある

「コーヒーを飲みたい」

→ 台所に行って電気ケトルのスイッチを入れる
→ 仕事をしに居室に戻る
→ 思いのほか集中してしまう
→ いつのまにかお湯が沸いて、 ぬるくなっている
→ 最初に戻る

<!--
お湯を沸かすのには電気代を気にしてケトルを使っているのですが、ついつい
スイッチを入れたまま集中してしまって、いつのまにかぬるくなっていることは
ないですか？
-->

---

# なにが問題か？

+ 2回、 せきを立つ必要がある
    + 集中が切れる回数を減らしたい
    + 最初にスイッチを入れるのを居室からできないか？

+ お湯が沸いてもわからない
    + 作業している PC に通知が来るとよい

<!--
もし、席を立たずにケトルのスイッチを入れられて、
お湯が沸いたときに通知されるようになったら、
時間を無駄にせずに熱いコーヒーが飲めそうです。
-->

---

<!--
_class: lead
_paginate: false
_header: ""
_footer: ""
-->

# MKCOFFEE

お湯を沸かすDOSコマンド

![](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/494add55-a4aa-2665-2f88-38b072dbc867.png)

<!--
そこで、普段はメモ帳や電卓を呼び出すのに使う「ファイル名を指定して実行」で、
お湯をわかせるようにしてみました。名付けてメイクコーヒーです。
いま実行して、お湯が沸くのを待ちながら続きをお話しします。
-->

---

![bg right:38%](https://sc01.alicdn.com/kf/HTB1eunbQFXXXXXeapXXq6xXFXXXO/226068070/HTB1eunbQFXXXXXeapXXq6xXFXXXO.jpg)

+ 中国製スマートプラグ
    + バックエンドが Tuya API のもの
    + OEMブランドが山ほどあります
    + Amazonなら1個千円程度

+ Raspberry Pi Zero W
+ 電気ケトル
    + お湯が沸くと電源が切れるもの

<!--
使うものはこちら。Amazonで買った安いスマートプラグが、今回の主役です。
スマートプラグは 15A くらいまで大丈夫だと思うのですが、ケトルの消費電力を
じゅうぶん確認してくださいね。
-->

---

## 動き

+ ケトルには水を入れ、スイッチを入れっぱなしにしておく

+ コマンド実行を受け取ったら、スマートプラグをON
+ スマートプラグの機能で電流値を監視する
+ お湯が沸くとケトルの電源が切れ、 電流が 0A になる
     → スマートプラグをOFF、 LINE Notify で通知する

<!--
あらかじめ、ケトルに水を入れてスイッチを入れっぱなしにしておくことで、
スマートプラグをONにするとお湯を沸かし始めるようにします。
お湯が沸くとケトルの電源が切れるので、スマートプラグの機能で検知して、
LINEで通知するようにします。

LINE Notifyなら、Windows のフォーカスアシストで通知が出ないようにしていても、
音が鳴るので気づけるんですね。
-->

---

# Node-RED で一発！

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/89b2180a-02f3-ae5f-982f-4d9b80ead26a.png)
HTTP リクエストするバッチファイル1行だけで完成してしまった……
記事執筆も含めて 4時間くらい。 OSSってすごい！

<!--
プログラムはそこそこ複雑になりそうな気がしていたんですが、Node-RED だけで
できてしまいました。スマートプラグ制御も、LINE Notify も、既成のノードを
使用しました。

Node-RED は HTTPを受け取ってスイッチを入れるようにしておき、後はパスの通っている
場所に該当のリクエストをとばす curl 一行だけ書いたバッチファイルを置きます。
-->

---

<!--
_class: lead
_paginate: false
header: ""
footer: ""
-->

詳細は [Qiita]() にまとめていますので、 ごらんください

# ありがとうございました

Twitter: [@plageoj](//twitter.com/plageoj)
Facebook: fb.me/plageoj

試される方は、 必ず水を入れておくこと + 定期的な水換えを。

<!--
今回作ったシステムでは空焚きの検知ができないので、試してみたいという方は
水を入れっぱなしにすることと、腐らないように定期的に水を入れ替えることを
お忘れなく。

詳細は Qiita をご覧ください。
-->

---

![bg 90%](https://lh3.googleusercontent.com/5ZLq4gZxYzqxs95f77JiFcbleCVBXDKrhHmEbymxXKYQr_5bX9j1Sa22CD6iztj4sAXRLfA1Onv_i1wBtHHMttYeuxQ31A5X10599WWDe75B2GQDusRNaMppRsF8b3vjuAMGEbiT56JTj_tG57K5KeC0Sr1De7eYyU1ugbDRr0nYyza0qHjwUcwBJyWnD4zDM6gF9lmDbaq-vYXSc20t5TX-CoQ67EHzBOjDD6QiOdweDbL3EqcxPkNnK3YdL95SBOZ61dcnSGtl8UW0wPuc_iFOMrD-ty767sUu30SqHFgQ5n9c0Y8kO9Wa4sJHVCPm2AVtlc35fR8TLBVO6_F1vtseembDsXrrkdbQDYM9ke_9xyqrKYWnR0UyXA2uc0bYUfoo9PaO2hwI2KnKkyBc364J3d8kFgApZygp3X8AumcTVe5KD8VqWAVdJ-G6uYeu2lXbZjTGCcUqpiGns-eppXNB3WRuu5SaxrLd29rSgBQ0GU9MLjsFX_Ktxlwv4OUkDTVJ4WK2OtVyWPia81KNkXk6hpFqxVZcz5cSx-JoyCkt4tK91jwp0rbSU8aoK8sF-XOefxoKNEF8RqzTgIjWZRYOCLsII_Wnjui9iLiyEpr2EEg33DrHGNN2v041GJwetfj8nJA8BXFzlcv5v8-_l-MBwSWjQE-Q01oTPSxXg-FhX7kpAU3lnSy8Ha5F3A=w1239-h929-no)

---
