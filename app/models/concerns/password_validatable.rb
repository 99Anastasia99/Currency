# frozen_string_literal: true

module PasswordValidatable
  extend ActiveSupport::Concern

  PASSWORD_COMPLEXITY_POLICIES = [
    { rule: /^(?=.*[a-z])./, message: "one lowercase letter" },
    { rule: /^(?=.*[A-Z])./, message: "one uppercase letter" },
    { rule: /^(?=.*\d)./, message: "one digit" },
    { rule: /^(?=.*[\p{P}\p{S}])./, message: "one special character" }
  ].freeze

  included do
    validate :password_complexity

    private

    def password_complexity
      return if password.blank?

      validation_errors = password_validation_errors

      return if validation_errors.blank?

      password_validation_message(validation_errors)
    end

    def password_validation_errors
      [].tap do |errors|
        PASSWORD_COMPLEXITY_POLICIES.each do |policy|
          errors << policy[:message] unless password =~ policy[:rule]
        end
      end
    end

    def password_validation_message(validation_errors)
      if validation_errors.size == 1
        errors.add :password, "must include at least #{validation_errors[0]}"
      else
        errors.add :password,
                   "must include at least #{validation_errors[0...-1].join(', ')} and #{validation_errors.last}"
      end
    end
  end
end
