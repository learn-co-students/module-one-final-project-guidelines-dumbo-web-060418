class Sign < ActiveRecord::Base
  has_many :planets, through: :charts
  has_many :users, through: :charts
end
