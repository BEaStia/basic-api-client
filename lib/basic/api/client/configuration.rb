# frozen_string_literal: true

module Basic
  module Api
    class Client
      # Connection Parameters
      class Configuration
        extend Dry::Initializer

        option :basic_url
        option :headers, default: proc { {} }
      end
    end
  end
end
