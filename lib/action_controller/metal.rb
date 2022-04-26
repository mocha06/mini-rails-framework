# frozen_string_literal: true

module ActionController
  class Metal
    attr_reader :request, :response

    def process(action)
      send action
    end

    def params
      request.params.symbolize_keys
    end
  end
end
