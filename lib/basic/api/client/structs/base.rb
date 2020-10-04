module Basic
  module Api
    module Client
      module Structs
        class Base < Dry::Struct
          transform_keys(&:to_sym)
        end
      end
    end
  end
end
