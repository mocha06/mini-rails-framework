require 'pry'
require 'spec_helper'
require 'active_support'

RSpec.describe ActiveSupport do
  before do
    ActiveSupport::Dependencies.autoload_paths = Dir["#{__dir__}/pastry-blog/app/*"]
  end
  
  describe 'initializing ActiveSupport' do
    context 'File searching' do
      let(:file_search) { ActiveSupport::Dependencies.search_for_file('application_controller') }
      let(:unknown_file_search) { ActiveSupport::Dependencies.search_for_file('unknown') }
      
      it 'loads correct files' do
        expect(file_search).to eq("#{__dir__}/pastry-blog/app/controllers/application_controller.rb")
      end

      it 'does not return unwanted files' do
        expect(unknown_file_search).to be nil
      end
    end
  end
end
