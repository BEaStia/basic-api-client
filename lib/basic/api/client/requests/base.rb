# frozen_string_literal: true

module Basic
  module Api
    module Client
      module Requests
        # Base request API, all other requests should be inherited from that request
        class Base
          def initialize(transport, options = {})
            @transport = transport
            @options = options
          end

          def call(body)
            http_response = perform(body)
            http_response.body
          end

          def url(_args = {})
            raise NotImplementedError
          end

          def perform(_body)
            raise NotImplementedError
          end
        end
      end
    end
  end
end
