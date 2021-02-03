require_relative "./calculator/spreadsheet/revenue_date"
require_relative "./calculator/spreadsheet/revenue_recognition"

class ContractCalculator
  def self.calc(price:, category:, signed_on:)
    case category
    in :word_processor
      {
        revenue_recognition: price,
        revenued_at: signed_on
      }
    in :spreadsheet
      { 
        revenue_recognition: Calculator::Spreadsheet::RevenueRecognition.calc(price),
        revenued_at: Calculator::Spreadsheet::RevenueDate.calc(signed_on),
      }
    end
  end
end
