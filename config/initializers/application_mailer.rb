# frozen_string_literal: true

require "staging_mail_interceptor"

ActionMailer::Base.register_interceptor(StagingMailInterceptor) if Rails.env.staging?

ActionMailer::Base.default_url_options[:host] = ENV["MAILER_HOST"]
