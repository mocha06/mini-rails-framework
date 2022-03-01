# frozen_string_literal: true

module ActionController
  class Base < Metal
    include Callbacks
  end
end
