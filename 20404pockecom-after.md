---
marp: true
title: Twitter for PC-G850 の今
footer: Twitter for PC-G850 の今
paginate: true
_paginate: false
theme: gaia
---

<style>
*{font-family: "biz udpgothic"}
code,pre{
    font-family: "OCR A";
}
</style>

# ほていや

広島といえば、やはりお好みでしょう！

![h:350px](https://i.imgur.com/bRUxgeR.jpg)![h:350px](https://i.imgur.com/XewWnHs.jpg)

---

# ほていや

![bg left contain](https://i.imgur.com/trHhN16.png)

横川駅北口から徒歩すぐ

+ オリーブオイル
+ 食後のコーヒーがうれしい
+ 手相占い

---

![bg opacity:10%](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

# Twitter for PC-G850 の今

## 菅原 政行

---

![bg opacity:10%](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

# 菅原政行 （@plageoj）

広島大学工学部３年生

実は電子系専攻。
情報系は**趣味**(？)です

---

# Twitter for PC-G850

MA2018、MA2019 に応募
## 史上初の三冠受賞！

ポケコンで Twitter ができるようになるカートリッジです。

![bg right](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

---

## 今日はその後のお話です

1. フリスクケース、その後
1. Z 会はじめました
1. 最近のアップデート
1. これからのこと

![bg right](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

---

# フリスクケース、その後

![bg opacity:10%](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

手近なサイズ感だったので気に入っていますが、問題がありました。

- ポケコンと高さが合わず、ピンヘッダの刺さりが甘い

    <!-- + プレゼン中に取れてしまうアクシデントが…… -->

- 加工箇所が多くて結構大変

    <!-- + マイコンの形に穴を開けないと蓋が閉まりません -->

  - マイコン嵌合、USB-micro、DIPSW、LED×2、ポケコン接続部
  - 強度も怪しい

- サイズがギリギリなので今後部品を増やせない
  - バッテリーとか3Gモデムとか搭載したい！

---

# 3Dプリンタを<br>買いました

ケースをプリントできるようになりました！

モノサシと目測で基板サイズを測りつつモデリング
ノギスは偉大。

![bg right](https://i.imgur.com/J0IqiGL.jpg)

---

# Z 会はじめました

![bg opacity:10%](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

ポケコンとカセット間の通信がボトルネックでした。

全部機械語で書けば……

- パラレル通信で最大 200 kbaud 出るかも？（ほんまかいな）

- 表示データの圧縮・直接転送

#### 最大 40倍の転送速度＋描画も高速化できる

アセンブリを勉強中。今後、高速度通信試験をします。

---

# 最近のアップデート

![bg opacity:10%](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

- リプライ機能が付きました。テスト中。
- 内部ライブラリを整理しました
    + 今後の機能追加もズンドコできる！


+ しかし、動作が怪しくなりました（メモリ不足？）

```text
[E][ssl_client.cpp:33] _handle_error():
[data_to_read():270]: (-80) UNKNOWN ERROR CODE (0050)
```

---

# これから

![bg opacity:10%](https://protopedia.net/sites/default/files/prototype/2016/img/IMG_20191111_015521.jpg)

+ バッテリーを搭載して、ケーブル無しで動作させたい。

* オール機械語にして、さらなる高速動作を
    + 転送の高速化
    + 描画の効率化（BIOSを迂回する）
    + ポケコン本体のプログラムを書き換えず、
      カートリッジの差し替えだけで他のSNSにも対応できるようになる

+ エラーの解消……。詳しい人助けてください

---

### ありがとうございました

![bg left](https://i.imgur.com/ISwkJfg.jpg)

今後のパワーアップにご期待
ください！