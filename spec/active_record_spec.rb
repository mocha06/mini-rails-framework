require 'spec_helper'
require 'active_record'
require 'pastry-blog/app/models/application_record'
require 'pastry-blog/app/models/post'

RSpec.describe ActiveRecord do
  let(:new_post) { Post.new(id: 1, title: 'First blog post') }
  describe 'initialization' do 
    context 'invoking active record' do
      it 'creates a new post' do
        expect(new_post.id).to eq 1
        expect(new_post.title).to eq('First blog post')
      end
    end
  end
end