class Task < ApplicationRecord
	belongs_to :list
	validates :header, presence: true,
						length: { minimum: 5 }
end
