class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  VALID_EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  validates :email, presence: true,
                    format: VALID_EMAIL_PATTERN,
                    uniqueness: { case_sensitive: false }

  def by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
