module Basic
  module Api
    class Client
      class ApiResponse
        attr_reader :status, :error, :body

        ERROR_STATUS = 'ERROR'.freeze

        # Error not described above
        NotDefinedError = Class.new(Basic::Api::Client::Error)

        def initialize(response)
          @response = response
          @status = :success
        end

        def parse
          if @response.status != 200
            fail_with_http_error
          else
            @body = parsed_response
          end

          self
        end

        def fail_with_http_error
          @status = :failed
          @error_message = nil
          @error_code = @response.status
        end

        def parsed_response
          @parsed_response ||= @response.body
        end

        def failed?
          status == :failed
        end
      end
    end
  end
end
