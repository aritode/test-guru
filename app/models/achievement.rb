class Achievement < ApplicationRecord

  belongs_to :badge
  belongs_to :user

end
