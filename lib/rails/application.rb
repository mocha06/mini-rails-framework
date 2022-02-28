module Rails
  class Application
    def self.inherited(klass)
      super
      @instance = klass.new
    end

    def self.instance
      @instance
    end

    def initialize!
      config_environment_path = caller.first
      @root = Pathname.new(File.expand_path("../..", config_environment_path))
      
      ActiveRecord::Base.establish_connection(database: "#{@root}/db/#{Rails.env}.sqlite3")
      ActiveSupport::Dependencies.autoload_paths = Dir["#{@root}/app/*"]
    end

    def root
      @root
    end
  end
end