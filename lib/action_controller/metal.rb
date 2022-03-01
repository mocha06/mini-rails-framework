# frozen_string_literal: true

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action)
      send action
    end
  end
end
