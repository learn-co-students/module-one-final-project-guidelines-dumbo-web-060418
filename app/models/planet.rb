class Planet < ActiveRecord::Base
  has_many :signs, through: :charts
  has_many :users, through: :charts
end
