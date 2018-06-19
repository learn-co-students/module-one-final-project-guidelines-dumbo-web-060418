class Chart < ActiveRecord::Base
  belongs_to :planet
  belongs_to :user
  belongs_to :sign
end
