class Sign < ActiveRecord::Base
  has_many :planets, through: :charts
  has_many :users, through: :charts

  def symbol
    SYMBOLS[self.name.to_sym]
  end
end
