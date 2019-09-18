class Badge < ApplicationRecord

  has_many :users, through: :achievements
  has_many :achievements

  validates :name, :image_url, :rule_type, presence: true

end
