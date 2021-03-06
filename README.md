# Availee (アベリー)

[![Product Name](https://github.com/jphacks/FK_1712/blob/readme/Screen%20Shot%202017-11-01%20at%200.56.52.png?raw=true)](https://youtu.be/BAdCOAW5DQE)

## 製品概要
### 時間 Tech

### 背景（製品開発のきっかけ、課題等）

#### 開発に至った背景
ちょっとご飯を食べに行きたいけど、誰が時間空いているのかわからない。急に暇になったけど、誰か暇な人と遊びに行きたい。そんなときに、一目で誰を誘えば良いのか、わかるツールがあったらいいなと思い、開発に至りました。
#### ターゲット
スケジュールの変動が激しい人や、友人との時間共有がうまくいかない人など、暇な時間を誰かと共有し、有意義な時間を過ごしたい人へ。


### 製品説明（具体的な製品の説明）
先2ヶ月のスケジュールから予定の入っていない時間を読み、同じ時間が空いている友人を表示するアプリケーションです。カレンダーで自分のスケジュールの管理もできます。  
#### 友達機能
友人をidで検索し友達申請を送信。友人が申請を許可すると友達登録が完了します。友達登録したユーザーの空き時間がタイムラインに表示されます。   
#### カレンダー   
カレンダーページには、自分のスケジュールが表示されます。iPhoneのカレンダーアプリなど、他のアプリケーションで入力した予定を表示し、またこのページからもカレンダーに予定を追加することができます。
#### トーク
空き時間がマッチングした友人と詳細を決めるための、トークページを用意しました。

### 特長

#### 1. 他のカレンダーアプリから自動的に予定を取ってくることにより、煩雑な予定入力を最小限に抑えました。
#### 2. 表示されている友人との空き時間のマッチングが一覧で表示され、それをタップするだけで、その友人とのトーク画面に移動することができます。
#### 3. 授業や仕事など週で固定の予定や、睡眠や身支度など毎日の固定の予定を入力することで、それらの予定は１度入力すると、その後入力しなくても済む仕様にしました。
### 解決出来ること
友人の空き時間を一目で把握できるようになることで、友人を誘う際に、スケジュール確認のメッセージを送る手間を省くことができました。

### 今後の展望
グループ機能の搭載。グループを作成し、それに参加することで、グループメンバー全員とマッチングした時間を表示します。グループメンバー全員がマッチングした時間が表示されるので、ミーティングの予定を決める際や、仲のいいメンバーと遊びに行く際に便利です。また、グループのトークページ、グループ全員がマッチングしなくても複数人マッチングした場合、何人がマッチングしたのかを明記し、表示する機能も考えています。


## 開発内容・開発技術
### 活用した技術
#### API・データ
今回スポンサーから提供されているAPI・データは使用しておりません。

#### フレームワーク・ライブラリ・モジュール
* EventKit
* Koyomi
* RealmSwift
* ImagePicker
* Alamofire

#### デバイス
* iOS

### 研究内容・事前開発プロダクト（任意）
チームの研究内容や、事前に持ち込みをしたプロダクトはありません。



### 独自開発技術（Hack Dayで開発したもの）
#### 2日間に開発した独自の機能・技術
人間の活動時間から空き時間を算出し、他ユーザーとの空き時間のマッチングを検出するアルゴリズムを生成しました。
