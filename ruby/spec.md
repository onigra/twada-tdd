## 最終的にやりたいこと

- 商品カテゴリによって収益認識ができる

## 仕様(制約、事実)

- 4つの商品のうち、1度に1つだけ契約できる
- 商品にはカテゴリがある
  - ワードプロセッサ
  - スプレッドシート
- 商品カテゴリにより、収益認識されるタイミングが異なる
  - ワードプロセッサは契約日に全額
  - スプレッドシートは
    - 契約日に売上の2/3
    - 30日後に残り1/3
      - 3で割れない場合、どちらかに1円のせる
        - なるべく早いタイミングで大きい金額で集積確認したい（1円は前に寄せる）
          - これはドメインロジック
      - 三四郎は3334, 1666

## 実装イメージ

- Product(ValueObject)
  - price
  - name
  - category
    - 型？
- Contract(Service)
  - signed_on
  - revenue
  - revenue_recognition

## タスクリスト

- [x] 商品が作成ができる
  - [x] 名前、価格、カテゴリをもって、商品が作成できる
- [ ] 契約ができる(ContractにProductとsigned_onを渡すと色々出てくるイメージ)
　　- [ ] 引数
　　  - [ ] Product
　　  - [ ] signed_on(DateTime)