class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.sort_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order('title desc')
  end
end
