# frozen_string_literal: true

class XlsxExporter < BaseService
  DATE_CELL = "date_of_operation"
  DEFAULT_ROW_NUMBER = 20

  def initialize(exported_data)
    @exported_data = exported_data
  end

  def call
    worksheet.append_row(row_data.map(&:titleize))
    cell_number = row_data.index(DATE_CELL)
    worksheet.set_column(cell_number, cell_number, DEFAULT_ROW_NUMBER, date_format)
    export
    workbook.read_string
  end

  private

  attr_accessor :exported_data

  def export
    exported_data.each do |object|
      worksheet.append_row(object.attributes.values)
    end
  end

  def row_data
    @row_data ||= Operation.column_names
  end

  def worksheet
    @worksheet ||= workbook.add_worksheet("Report")
  end

  def workbook
    @workbook ||= FastExcel.open
  end

  def date_format
    @date_format ||= workbook.number_format("[$-409]d/m/yy h:mm AM/PM;@")
  end
end
