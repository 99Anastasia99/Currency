# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "Online Exchanger <no-reply@onlinexchanger.herokuapp.com>"
  layout "mailer"
end
