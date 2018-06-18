class User < ActiveRecord::Base[5.1]
  has_many :meals, through: :user_meals
end
