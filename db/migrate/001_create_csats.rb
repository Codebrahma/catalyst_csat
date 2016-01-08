class CreateCsats < ActiveRecord::Migration
  def change
    create_table :csats do |t|

      t.references :project, index: true, foreign_key: true

      t.integer :score


    end

  end
end
