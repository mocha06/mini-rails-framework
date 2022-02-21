require 'connection_adapter'

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

    
    def self.establish_connection(options)
      @@connection = ConnectionAdapter::SqliteAdapter.new(options[:database])
    end
    
    def self.connection
      @@connection
    end

    def self.find(id)
      attributes = connection.execute("SELECT * FROM #{self}s WHERE id=#{id.to_i}").first
      new(attributes)
    end

    def self.all
      connection.execute("SELECT * FROM #{self}s").map do |attributes|
        new(attributes)
      end
    end
  end
end