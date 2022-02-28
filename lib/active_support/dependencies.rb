require 'pry'

module ActiveSupport
  module Dependencies
    extend self
    
    attr_accessor :autoload_paths
    self.autoload_paths = []

    binding.pry
    def search_for_file(name)
      binding.pry
      autoload_paths.each do |path|
        binding.pry
        file = File.join(path, "#{name}.rb")
        binding.pry
        if File.file? file
          return file
        end
      end
      nil
    end
  end
end
