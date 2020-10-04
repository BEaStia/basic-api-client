# frozen_string_literal: true

module Basic
  module Api
    class Client
      # Api request tuple implementation
      class ApiRequest
        extend Dry::Initializer
        option :request
        option :form
        option :response
      end
    end
  end
end
