class AddToEmailToCsatConfigs < ActiveRecord::Migration
  def up
    add_column :csat_configs, :to_email, :string
  end

  def down
    remove_column :csat_configs, :to_email
  end
end
