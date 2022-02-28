require 'pry'
require 'spec_helper'
require 'active_support'

RSpec.describe ActiveSupport do
  before do
    ActiveSupport::Dependencies.autoload_paths = Dir["#{__dir__}/pastry_blog/app/*"]
  end
  
  describe 'initializing ActiveSupport' do
    context 'File searching' do
      binding.pry
      let(:file) { ActiveSupport::Dependencies.search_for_file('application_controller') }
      it 'loads correct files' do
        expect(file).to eq("#{__dir__}/pastry_blog/app/controllers/application_controller.rb")
      end
    end
  end
end