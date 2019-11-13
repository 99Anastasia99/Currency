# frozen_string_literal: true

class BaseService
  class << self
    def call(*args)
      new(*args).call
    end

    def async_call(*args)
      ServiceInvocationJob.perform_later(to_s, args)
    end
  end
end
