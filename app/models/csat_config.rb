class CsatConfig < ActiveRecord::Base
  unloadable
  belongs_to :project
  validates :project_id, presence: true
  validates :frequency, presence: true, inclusion: { in: %w(manual daily weekly monthly).map(&:to_i) }
end
