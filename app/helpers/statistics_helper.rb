# frozen_string_literal: true

module StatisticsHelper
  RANGES = {
    "day" => [(Day.first.current_date - 1.day)..Day.first.current_date].freeze,
    "week" => [(Day.first.current_date - 1.week)..Day.first.current_date].freeze,
    "month" => [(Day.first.current_date - 1.month)..Day.first.current_date].freeze,
    "all" => nil
  }

  def type_of_operation_diagram(period)
    pie_chart Operation.group(:type_of_operation).sum(:amount),
      title: "Type of operation with amount", download: true
  end

  def count_of_operations(period)
    operations = period == "all" ? Operation.group_by_day(:date_of_operation) : period_of_operations(period)
    line_chart operations.count, title: "Count of operations", download: {background: "#ffffff"}
  end

  def amount_of_operations(period)
    operations = period == "all" ? Operation.group_by_day(:date_of_operation) : period_of_operations(period)
    line_chart operations.sum(:amount),title: "Amount of operations",
      prefix: "$", download: {background: "#ffffff"}
  end

  def currency_for_sell(period)
    column_chart period_of_operations(period).group(:banknote_name).count,
      title: "Count of sell operations", download: true
  end

  def currency_for_purchase(period)
    column_chart period_of_operations(period).group(:banknote_name_2).count,
      title: "Count of purchase operations", download: true
  end

  def amount_for_sell(period)
    column_chart period_of_operations(period).group(:banknote_name).sum(:amount), title: "Amount of sell operations",
      prefix: "$", download: true
  end

  def amount_for_purchase(period)
    column_chart period_of_operations(period).group(:banknote_name_2).sum(:amount), title: "Amount of purchase operations",
      prefix: "$", download: true
  end

  def period_of_operations(period)
    range = RANGES.fetch(period)
    self.send("operation_by_#{period}", *(range)) if StatisticsController::PERIODS.include?(period)
  end

  def operation_by_day(range)
    Operation.group_by_hour(:date_of_operation, range: range, format: "%-l %P")
  end

  def operation_by_week(range)
    Operation.group_by_day(:date_of_operation, range: range)
  end

  def operation_by_all(range = nil)
    Operation
  end

  def operation_by_month(range)
    Operation.group_by_week(:date_of_operation, range: range)
  end
end

