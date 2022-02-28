require 'spec_helper'
require 'active_record'

require 'pastry-blog/app/models/application_record'
require 'pastry-blog/app/models/post'

RSpec.describe ActiveRecord do
  before do
    Post.establish_connection(database: "#{__dir__}/pastry-blog/db/development.sqlite3")
  end

  describe 'initialization' do
    context 'invoking active record' do
      let(:new_post) { Post.new(id: 1, title: 'Blueberry Muffins') }
      
      it 'creates a new post' do
        expect(new_post.id).to eq 1
        expect(new_post.title).to eq('Blueberry Muffins')
      end
    end
  end

  describe 'testing sqlite connection' do
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
  describe 'searching for records from database' do
    context 'finding a record based on the id' do
      let(:post1) { (Post.find(1)) }

      it 'brings back the record row' do
        expect(post1.id).to eq 1
        expect(post1.title).to eq('Blueberry Muffins')
      end
    end

    context 'searching for all records' do
      let(:all_posts) { (Post.all)}

      it 'brings back all records' do
        expect(all_posts).to be_kind_of(ActiveRecord::Relation)
        expect(all_posts.count).to eq 2
        expect(all_posts.last.id).to eq 2
      end
    end

    context 'searching for records based on specific parameters' do
      let(:relation) { Post.where("id = 2").where("title IS NOT NULL") }
      let(:post2) { relation.first } 
      let(:native_sql) { "SELECT * FROM posts WHERE id = 2 AND title IS NOT NULL" }
      it 'brings record(s)' do
        expect(relation).not_to be nil
        expect(post2.id).to eq 2
        expect(native_sql).to eq(relation.to_sql)
      end
    end
  end
end
