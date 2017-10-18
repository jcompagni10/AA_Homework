class ChangeTableName < ActiveRecord::Migration[5.1]
  def self.up
      rename_table :people_tables, :people
    end
end
