class AddCreatedAtToCsats < ActiveRecord::Migration
  def up
    add_column :csats, :created_at, :datetime
  end

  def down
    remove_column :csats, :created_at 
  end
end
