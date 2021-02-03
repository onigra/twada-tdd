class Calculator
  class Spreadsheet
    class RevenueDate
      def self.calc(signed_on)
        signed_on + (86400 * 30) # 30日後
      end
    end
  end
end
