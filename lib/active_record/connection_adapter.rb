# frozen_string_literal: true

module ActiveRecord
  module ConnectionAdapter
    class SqliteAdapter
      def initialize(file)
        require 'sqlite3'

        @db = SQLite3::Database.new(file.to_s, results_as_hash: true)
      end

      # 'execute' method:
      # Executes an SQL Query and return the results as an array of hashes
      # Example:

      # > adapter.execute("SELECT * FROM users")
      # => [
      #   { id: 1, name: "Roberto" },
      #   { id: 2, name: "Mayara" }
      # ]
      #
      def execute(sql)
        @db.execute(sql).each do |row|
          row.keys.each do |key|
            value = row.delete(key)
            # Only keeps string key (ignores index-based key, 0,1, ...)
            row[key.to_sym] = value if key.is_a? String
          end
        end
      end

      # 'columns' method returns the column value of a table
      def columns(table_name)
        @db.table_info(table_name).map { |info| info['name'].to_sym }
      end
    end

    # TODO: (maybe): Implement adapters for Postgres and Mysql

    # class MysqlAdapter
    #   def exectute(sql)
    #     # Implement execution of query in MySQL
    #   end
    # end

    # class PostgresAdapter
    #   def exectute(sql)
    #     # Implement execution of query in PostgreSQL
    #   end
    # end
  end
end
