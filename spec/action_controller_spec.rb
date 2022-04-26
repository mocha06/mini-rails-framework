# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActionController do
  describe 'mock controller tests' do
    class TestController < ActionController::Base
      before_action :callback, only: [:show]

      def index
        @response = []
        @response << 'index'
      end

      def show
        @response << 'show'
      end

      private

      def callback
        @response = []
        @response << 'callback'
      end
    end

    let(:controller_instance) { TestController.new }

    describe 'testing controller calls' do
      context 'Calling index method' do
        let(:response) { ['index'] }

        it 'will correctly execute the method' do
          expect(controller_instance.process(:index)).to eq(response)
        end
      end
    end

    describe 'Testing callbacks' do
      context 'callback for show method' do
        let(:response) { %w[callback show] }

        it 'will call the show method' do
          expect(controller_instance.process(:show)).to eq(response)
        end
      end
    end
  end

  # TODO
  # describe 'Real controller test' do
  #   context 'Post Controller calls show method' do
  #     class Request
  #       def params
  #         { 'id' => 1 }
  #       end
  #     end
  #     let(:posts_controller) { PostsController.new }
  #     let(:posts_controller_request) { posts_controller.request }
  #     let(:request_instance) { Request.new }

  #     it 'executes method' do
  #       binding.pry
  #       posts_controller_request = request_instance
  #       expect(posts_controller.process(:show)).to be nil
  #     end
  #   end
  # end
end
