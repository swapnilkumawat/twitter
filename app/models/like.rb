class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  scope :active, -> { where(active: true) }
end
