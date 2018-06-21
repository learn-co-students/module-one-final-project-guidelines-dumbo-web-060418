class User < ActiveRecord::Base
  has_many :signs, through: :charts
  has_many :planets, through: :charts
  has_many :charts

  def self.all_names
    User.all.map { |user| user.name }
  end

  def delete_chart
    self.charts.each { |chart| chart.destroy }
  end

  def sorted_chart
    self.charts.sort_by { |chart| chart.planet_id }
  end

  def self.update_name(old_name, new_name)
    user = User.find_by(name: old_name)
    user.update(name: new_name)
  end

  def update_birthday
    self.charts.each { |chart| chart.destroy }
    update_chart
  end
end
