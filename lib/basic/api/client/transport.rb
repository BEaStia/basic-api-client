# frozen_string_literal: true

require 'faraday'

module Basic
  module Api
    class Client
      # Basic Http Transport implementation
      class Transport
        def initialize(basic_url:, headers: {})
          @conn = Faraday.new(url: basic_url) # create a new Connection with basic URL
          headers.each do |name, value|
            @conn.headers[name] = value
          end
        end

        protected

        # @example: %i[post get patch put delete]
        def allowed_methods
          raise NotImplementedError
        end

        def implemented_method?(name)
          allowed_methods.include?(name)
        end

        private

        def respond_to_missing?(name, include_private)
          implemented_method?(name) || super
        end

        def method_missing(symbol, *args)
          if implemented_method?(symbol)
            @conn.public_send(symbol, *args)
          else
            super
          end
        end
      end
    end
  end
end
