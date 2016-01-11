class Csat < ActiveRecord::Base
  unloadable
  belongs_to :project
  belongs_to :survey
end
