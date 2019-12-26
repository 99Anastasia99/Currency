# frozen_string_literal: true

class StagingMailInterceptor
  ALLOWED_DOMAINS = ENV["ALLOWED_DOMAINS"].split.freeze
  MAIL_DOMAIN_REGEXP = /^.*@(.*)$/

  class << self
    def delivering_email(message)
      unless deliver?(message)
        message.perform_deliveries = false
        Rails.logger.debug "Interceptor prevented sending mail #{message.inspect}!"
      end
    end

    def deliver?(message)
      message.to.each do |recipient|
        return true if mail_domain(recipient).in?(ALLOWED_DOMAINS)
      end
      false
    end

    def mail_domain(address)
      address.match(MAIL_DOMAIN_REGEXP).try(:[], 1)
    end
  end
end
