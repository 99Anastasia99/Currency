# frozen_string_literal: true

class PasswordComplexityValidator < ActiveModel::EachValidator
  PASSWORD_REGEXP = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z]).*\z/

  def validate_each(record, attribute, value)
    return if value =~ PASSWORD_REGEXP
    message = options[:message] || :password_too_simple
    record.errors.add(attribute, message)
  end
end
