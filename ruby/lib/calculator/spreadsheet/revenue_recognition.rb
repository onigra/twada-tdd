class Calculator
  class Spreadsheet
    class RevenueRecognition

      # カテゴリがspreadsheetの場合、価格の3分の2が売上認識される
      # 価格が3で割り切れない場合、なるべく早いタイミングで大きい金額で集積確認したいため
      # 収益認識に端数をプラスする
      # amountが3未満の場合は仕様が決まってないのでエラーとりあえずエラーにする
      def self.calc(amount)
        raise ArgumentError if 3 > amount

        tmp_revenue = amount / 3 * 2
        fraction = amount % 3
        revenue_recognition = tmp_revenue + fraction
      end
    end
  end
end
