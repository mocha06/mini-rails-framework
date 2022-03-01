module ActionController
  module Callbacks
    class Callback
      def initialize(method, options)
        @method = method
        @options = options
      end

      def match?(action)
        binding.pry
        if @options[:only]
          @options[:only].include? action.to_sym
        else
          true
        end
      end

      def call(controller)
        controller.send @method
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      binding.pry
      def before_action(method, options = {})
        before_actions << Callback.new(method, options)
        binding.pry
        
      end

      def before_actions
        @before_action ||= []
      end

    end
    def process(action)
      self.class.before_actions.each do |callback|
        binding.pry
        if callback.match?(action)
          callback.call(self)
        end
      end
      
      super
    end
  end
end