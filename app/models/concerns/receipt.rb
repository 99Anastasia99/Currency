# frozen_string_literal: true

module Receipt
  extend ActiveSupport::Concern

  def receipt
    Receipts::Receipt.new(
      id: id,
      subheading: "Receipt for operation №   #{id}",
      product: "Currency converter",
      company: company_information,
      line_items: text,
      font: font
    )
  end

  private

  def company_information
    {
      name: "Thank you!",
      address: "Kurchatova, 5 str.\n Minsk",
      email: "anastasiya.shimanskaya@kandasoft.com"
    }
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength

  def text
    [
      ["Date", date_of_operation.to_s],
      ["From", banknote_name.to_s],
      ["To", banknote_name_2.to_s],
      ["Client", "#{user_name.titleize} #{user_surname.titleize}"],
      ["Cashier", "#{cashier_name.titleize} #{cashier_surname.titleize}"],
      ["Amount", amount.to_s],
      ["Selling rate", selling_rate.to_s],
      ["Purchase rate", purchase_rate.to_s],
      ["Type of operation", type_of_operation.to_s],
      ["Result", result.round(2).to_s]
    ]
  end

  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def font
    {
      bold: Rails.root.join("app/assets/fonts/receipts/TradeGothic-Bold.ttf"),
      normal: Rails.root.join("app/assets/fonts/receipts/TradeGothic.ttf")
    }
  end
end
