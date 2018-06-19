require 'net/http'
require 'uri'
require_relative "../application.rb"

class VRClient

  @@baseURL = "http://api.vedicrishiastro.com/v1/planets/tropical"

  def initialize(uid=nil,key=nil)
    @userID = uid
    @apiKey = key
  end

  def display()
		return {
			'userid' => @userID,
			'key' => @apiKey
		}
	end

  def get(data)
    url = URI.parse(@@baseURL)
    req = Net::HTTP::Post.new(url)
    req.basic_auth @userID, @apiKey
    req.set_form_data(data)
    resp = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    JSON.parse(resp.body)
  end

  def data(date, month, year, hour, minute, latitude, longitude, timezone)
    return {
      'day' => date,
      'month' => month,
      'year' => year,
      'hour' => hour,
      'min' => minute,
      'lat' => latitude,
      'lon' => longitude,
      'tzone' => timezone
    }
	end

  def call(date, month, year, hour, minute, latitude, longitude, timezone)
		data = self.data(date, month, year, hour, minute, latitude, longitude, timezone)
		get(data)
	end
end
