require 'spec_helper'

RSpec.describe ActiveSupport do
  describe 'Testing ActiveSupport Dependencies' do
    context 'File searching' do
      let(:file_search) { ActiveSupport::Dependencies.search_for_file('application_controller') }
      let(:unknown_file_search) { ActiveSupport::Dependencies.search_for_file('unknown') }
      
      it 'loads correct files' do
        expect(file_search).to eq("#{__dir__}/pastry-blog/app/controllers/application_controller.rb")
        expect(unknown_file_search).to be nil
      end
    end
  end

  describe 'Testing Active Support Core Extensions' do
    context 'String class' do
      let(:model) { :Post.to_s.underscore }
      let(:controller) { :ApplicationController.to_s.underscore }

      it 'underscores a string' do
        expect(model).to eq ('post')
        expect(controller).to eq ('application_controller')
      end
    end
  end

  describe 'Loading Constants' do
    context 'when constants are not initialized yet' do 
      it 'automatically loads them' do
        Post
      end
    end
  end
end
