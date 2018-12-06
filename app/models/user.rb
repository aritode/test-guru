class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  VALID_EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  validates :name, :role, presence: true
  validates :email, presence: true,
                    format: VALID_EMAIL_PATTERN,
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    user&.authenticate(password)
  end

  def by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
