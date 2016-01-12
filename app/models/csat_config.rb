class CsatConfig < ActiveRecord::Base
  unloadable
  belongs_to :project
  validates :project_id, presence: true, uniqueness: true
  validates :frequency, presence: true, inclusion: { in: %w(manual daily weekly monthly) }
  validates :to_email, presence: true
end
