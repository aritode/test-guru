class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :results
  has_many :users, through: :results

  def self.sort_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order('title desc')
  end
end
