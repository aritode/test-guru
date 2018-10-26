class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :author, class_name: 'User'

  scope :easy,    -> { where(level: 0..1) }
  scope :medium,  -> { where(level: 2..4) }
  scope :hard,    -> { where(level: 5..Float::INFINITY) }

  def self.sort_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
