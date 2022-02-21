require 'spec_helper'
require 'active_record'
require 'pry'

require 'pastry-blog/app/models/application_record'
require 'pastry-blog/app/models/post'

RSpec.describe ActiveRecord do
  let(:new_post) { Post.new(id: 1, title: 'Blueberry Muffins') }
  
  describe 'initialization' do 
    context 'invoking active record' do
      it 'creates a new post' do
        expect(new_post.id).to eq 1
        expect(new_post.title).to eq('Blueberry Muffins')
      end
    end
  end
  
  describe 'testing sqlite connection' do
    before do
      Post.establish_connection(database: "#{__dir__}/pastry-blog/db/development.sqlite3")
    end
    context 'running a sql query' do
      let(:rows) { Post.connection.execute("SELECT * FROM posts") }
      let(:row) { rows.first }

      it 'brings back results correctly' do
        expect(rows).to be_kind_of(Array)
        expect(row).to be_kind_of(Hash)
        expect(row.keys).to eq([:id, :title, :body, :created_at, :updated_at])
      end
    end
  end
  describe 'loading records from database' do
    context 'querying for a record' do

      let(:post1) { (Post.find(1)) }

      it 'brings back results of said record' do
        expect(post1.id).to eq 1
        expect(post1.title).to eq('Blueberry Muffins')
      end
    end
  end
end