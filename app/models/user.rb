class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  def by_level(level)
    tests.level(level)
  end
end
