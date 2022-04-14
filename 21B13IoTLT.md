---
marp: true
title: USBインタラプタをつくる - IoTLT広島特別編 with HiBiS
header: USBインタラプタをつくる
_header: ""
footer: IoTLT広島特別編 with HiBiS
theme: gaia
paginate: true
_paginate: false
_class: lead
---

<style>
*{
    font-feature-settings: "palt";
}
p {
    font-size: 1.2em;
    line-height: 1.5em;
}
</style>

# USB インタラプタをつくる

菅原 政行（ぺんた [@plageoj](https://twitter.com/plageoj)）

---

## きっかけ

武村さん ([@tatasuya1970](https://twitter.com/tatsuya1970)) の草刈りゲームで、

> 「リアル草刈り機が動いていない時はゲームコントローラーを効かなくしたい」

リレーモジュールで電源線を切る対応では、信号が残り続けてしまう

---

## USB の仕様を読んでみる

USB2.0 には 4 本の線がある

1. VBUS(+5V)
2. DATA-
3. DATA+
4. GND

参考: [USB 概説](https://avr.jp/user/EC/PDF/USBspcs.pdf#page=8)

---

## USB の仕様を読んでみる

![w:700px](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/8dc580a7-7c9d-abd7-2106-fbdbc1e55ca6.png)

---

## USB コネクタを抜いたことにする

- `DATA-` `DATA+` はホスト側でプルダウンされている

- `DATA-` `DATA+` の両方を LOW（0.3V 未満）に落として
  一定時間（2.5μs 以上）待つと、コネクタを抜いたことになる

→ データ線を GND ににつないであげれば良い

---

## USB の仕様を読んでみる

![w:700px](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/116845/8dc580a7-7c9d-abd7-2106-fbdbc1e55ca6.png)

---

## USB コネクタを抜いたことにする

---

## できたもの

- Grove 互換 I/F

- 手動用スイッチ

- 安定のフリスクサイズ

---

<!-- _class: lead -->

## 結局いらなくなった…

---

## どう使うか

- マイコンのリセットをかけたいときに

- リモートでハードウェアを抜き差ししたいときに

→ 組み合わせできそうなネタ求む
