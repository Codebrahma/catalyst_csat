class Survey < ActiveRecord::Base
  unloadable

  validates :delivered_as_promised, presence: true, inclusion: { in: %w(0 1).map(&:to_i) }
  validates :delivered_on_time, presence: true, inclusion: { in: %w(0 1).map(&:to_i) }
  validates :satisfaction, presence: true, inclusion: { in: %w(1 2 3).map(&:to_i) }

end
