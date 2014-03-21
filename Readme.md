# OS X MavericksでJPEGファイルのIPTCタグをFinderのタグへ設定する

写真の管理にPicasaなどを使っている際に、写真へ付けたタグがIPTCのタグとしてタグ付けされることがある。
これはOS X Mavericksの検索で扱いにくい為、IPTCのタグをファイルの拡張属性のタグへ付け直すAppleScriptを起動するドロップレットを作成する。

## インストール

git cloneしてmakeするとIptc2tag.appが出来るので、Finderで/Applications へインストールし、Dockへ入れておく。

## 実行

DockのIptc2tagへタグを移植したいJPEGファイルをファインダーからドロップする。

## アンインストール

Iptc2tag.appをゴミ箱へ捨てます。

## バグ

アイコンをまだ弄っていない。
