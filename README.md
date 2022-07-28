
# 本棚マネージャー

## サイト概要
### サイトテーマ
読んだ本を投稿するレビューサイトで投稿した本は一覧に本棚として表示し、
読まなくなって売ったり、捨てたり処分した本は処分済みに表示して残しておける本棚の管理ができるレビューサイト

### テーマを選んだ理由
私は読書が趣味でよく本を読むのですが、すぐに本棚がいっぱいになってしまいますので本棚に入りきれなかった本は選定して処分します。
時々本を買う際に前に読んだ本を買ってしまいそうになったり、処分した本が気になったときに調べられなくて困ったことがあります。

そこで読み終わった本だけでなく処分した本も残しておけるようなサイトがあれば自分は何の本を持ってるか、何の本を読んだかを
知ることができます。
また、本の片付けをする際に
「あとあと気になって読みたくなるかもしれない」
「もう読まないけど残しておきたい」
というときに記録しておくことができれば処分もしやすくなり本の整理にも役立てるのではないかと思いこのテーマにしました。

レビューサイトにしたのは他のユーザーのレビューを見て気になる本を買うための参考にしたり、本棚を見ることにより自分と似た
読書の傾向をしたユーザーとコメントを通してコミュニケーションをとれるようなサイトにしたかったためです。

### ターゲットユーザ
- 本を読む方
- 本棚や処分した本の管理をしたい方
- 気になる本のレビューを知りたい方

### 主な利用シーン
- 本を読み終わった時
- 読み終わった本を本棚にしまう時
- 本棚の本を処分する時
- 気になる本を調べたい時

## 設計書
<!--### 基本設計-->
<!--- 実装機能リスト<br>-->
<!--URL：https://docs.google.com/spreadsheets/d/1f1ceoEWWii9XgLuU5XPGY3BDRCHmx5gdlEmc_Sk1FKQ/edit#gid=1091086188-->
<!--- WBS<br>-->
<!--URL：https://docs.google.com/spreadsheets/d/1eM8f8JtH7bN6VhV-i-u89uWzS5ik4SPMuMlohqKst8U/edit#gid=977420151-->

### 画面設計
- 画面遷移図（管理者側）<br>
URL：https://app.diagrams.net/#G12gOUpQH89oiXXlfj8l5ibDyWHldjqtoS
- 画面遷移図（ユーザー側）<br>
URL：https://app.diagrams.net/#G10PbcLqE4X36aX-_cT6z1ZemVrusjwuVa
- ワイヤーフレーム（管理者側）<br>
URL：https://app.diagrams.net/#G1PYmkOka51JqiFf0GjldTMLbLQD9v_ecE
- ワイヤーフレーム（ユーザー側）<br>
URL：https://app.diagrams.net/#G1qbNk4NrIIiOCzP9vfw8x0w8iNm5S1-os

### DB設計
- ER図<br>
URL：https://app.diagrams.net/#G1NprU74MRQmaGT6RUOeVtHUydntzklB8O
- テーブル定義書<br>
URL：https://docs.google.com/spreadsheets/d/1nBQo0LnUww747Zb5dvmElHG_Jq6DEMYIXwYBEH95GWE/edit#gid=0

### 詳細設計
- アプリケーション詳細設計図<br>
URL：https://docs.google.com/spreadsheets/d/1x5Y94AL_o7bbY8i81GedBcjM3BhrEhxQv8_yTP4BQ1Q/edit#gid=549108681


## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
## 使用素材