require 'spec_helper'

RSpec.describe ActionController do  
  class TestController < ActionController::Base
    before_action :callback, only:[:show]

    
    def index
      @response = []
      @response << "index"
    end
    
    def show
      @response << "show"
    end
    
    private

    def callback
      @response = []
      @response << "callback"
    end      
  end

  let(:controller_instance) { TestController.new }
  
  describe 'testing controller calls' do
    context 'Calling index method' do
      let(:response) { ["index"] }
      
      it 'will correctly execute the method' do
        expect(controller_instance.process :index).to eq(response)
      end
    end
  end

  describe 'Testing callbacks' do
    context 'callback for show method' do
      let(:response) { ["callback", "show"] }

      it 'will call the show method' do
        expect(controller_instance.process :show).to eq(response)
      end
    end
  end
end