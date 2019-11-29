# frozen_string_literal: true

module Receipt
  extend ActiveSupport::Concern

  def receipt
    Receipts::Receipt.new(
      id: id,
      subheading: "Receipt for operation №#%{id}",
      product: "Currency converter",
      company: {
        name: "Thank you!",
        address: "Kurchatova, 5 str.\n Minsk",
        email: "anastasiya.shimanskaya@kandasoft.com"
      },
      line_items: [
        ["Date", "#{date_of_operation.strftime("%d-%m-%Y")}"],
        ["From", "#{banknote_name}"],
        ["To", "#{banknote_name_2}"],
        ["Client", "#{user_name.titleize} #{user_surname.titleize}"],
        ["Cashier", "#{cashier_name.titleize} #{cashier_surname.titleize}"],
        ["Amount", "#{amount}"],
        ["Selling rate", "#{selling_rate}"],
        ["Purchase rate", "#{purchase_rate}"],
        ["Type of operation", "#{type_of_operation}"],
        ["Result", "#{result.round(2)}"]
      ],
      font: {
        bold: Rails.root.join('app/assets/fonts/receipts/TradeGothic-Bold.ttf'),
        normal: Rails.root.join('app/assets/fonts/receipts/TradeGothic.ttf'),
      }
    )
  end
end
