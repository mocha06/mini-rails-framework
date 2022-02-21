module ActiveRecord
  class Base
    def self.primary_abstract_class=(value)
      # to-do
    end

    def initialize(attributes = {})
      @attributes = attributes
    end

    def id
      @attributes[:id]
    end

    def title
      @attributes[:title]
    end
  end
end