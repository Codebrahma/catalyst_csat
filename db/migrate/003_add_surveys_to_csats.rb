class AddSurveysToCsats < ActiveRecord::Migration
  def up
    add_reference :csats, :survey, index: true
  end

  def down
    remove_reference :csats, :survey
  end
end
