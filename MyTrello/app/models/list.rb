class List < ApplicationRecord
	has_many :tasks, dependent: :destroy
	validates :header, presence: true,
						length: { minimum: 5 }
end
