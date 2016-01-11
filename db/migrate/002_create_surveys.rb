class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|

      t.integer :delivered_as_promised

      t.integer :delivered_on_time

      t.integer :satisfaction

      t.text :pros

      t.text :improvements


    end

  end
end
