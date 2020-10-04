# frozen_string_literal: true

require 'basic/api/client/version'
require 'basic/api/client/transport'

module Basic
  module Api
    class Client
      class Error < StandardError; end

      def execute(container, options)
        form = container.form.new(options)
        http_response = container.request.new(transport).perform(form)

        api_response = api_response_class.new(http_response).parse
        if api_response.failed?
          nil
        else
          container.response.new(api_response.body)
        end
      end

      protected

      def api_response_class
        Basic::Api::Client::ApiResponse
      end

      def default_basic_url
        ''
      end

      def default_headers
        {}
      end

      private

      def transport
        @transport ||= Basic::Api::Client::Transport.new(
          basic_url: configuration.basic_url,
          headers: configuration.headers
        )
      end

      def configuration
        Basic::Api::Client::Configuration.new(
          basic_url: default_basic_url,
          headers: default_headers
        )
      end
    end
  end
end
