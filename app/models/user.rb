class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results

  def by_level(level)
    tests.where(level: level)
  end
end
