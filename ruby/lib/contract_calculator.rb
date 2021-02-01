class ContractCalculator
  def self.calc(price:, category:, signed_on:)
    if category == "word_processor"
      { revenue_recognition: price, revenued_at: signed_on}
    else
      # カテゴリがspreadsheetの場合、価格の3分の2が売上認識される
      # 価格が3で割り切れない場合、なるべく早いタイミングで大きい金額で集積確認したいため
      # 収益認識に端数をプラスする
      tmp_revenue = price / 3 * 2
      fraction = price % 3
      revenue_recognition = tmp_revenue + fraction

      revenued_at = signed_on + (86400 * 30)
      
      { revenue_recognition: revenue_recognition, revenued_at: revenued_at}
    end
  end
end
