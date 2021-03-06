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
  has_many :gists

  has_many :achievements
  has_many :badges, through: :achievements

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

  def full_name
    [first_name, last_name].join(' ')
  end

  def admin?
    is_a?(Admin)
  end

end
