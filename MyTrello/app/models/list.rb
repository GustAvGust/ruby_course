class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_save :cap_list_header
  scope :actual, -> { where('created_at > :date_of_create', date_of_create: Date.today - 1.month) }
  validates :header, presence: true,
                     length: { minimum: 5 }

  private
  def cap_list_header
  	self.header = self.header.capitalize
  end
end
