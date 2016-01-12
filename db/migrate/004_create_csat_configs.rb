class CreateCsatConfigs < ActiveRecord::Migration
  def change
    create_table :csat_configs do |t|

      t.references :project, foreign_key: true

      t.text :message

      t.string :frequency


    end
    add_index :csat_configs, :project_id
  end
end
