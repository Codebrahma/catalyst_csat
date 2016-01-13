class CsatConfig < ActiveRecord::Base
  unloadable
  belongs_to :project
  validates :project_id, presence: true, uniqueness: true
  validates :frequency, presence: true, inclusion: { in: %w(manual daily weekly monthly) }
  validates :to_email, presence: true

  def self.default_message
    "Below has been attached a link for the customer feedback form. It will only take a minute of your valuable time but will be immensely helpful for us."
  end
end
