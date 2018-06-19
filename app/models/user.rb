class User < ActiveRecord::Base
  has_many :signs, through: :charts
  has_many :planets, through: :charts
  has_many :charts
end
