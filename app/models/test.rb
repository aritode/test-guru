class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :author, class_name: 'User'

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: 'Title and Level must be unique'}

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope { order(title: :desc) }

  scope :level, ->(level) { where(level: level) }
  scope :by_category, ->(category_title) do
    joins(:category).where(categories: { title: category_title })
  end

  scope :easy,    -> { level(0..1) }
  scope :medium,  -> { level(2..4) }
  scope :hard,    -> { level(5..Float::INFINITY) }

  def self.sort_by_category(category_title)
    by_category(category_title)
      .pluck(:title)
  end
end
