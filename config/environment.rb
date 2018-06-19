require 'bundler'
Bundler.require
require_all 'lib'
require_all 'app'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger.level = 1


CLIENT = VRClient.new(USER_ID, API_KEY)

SUN = Planet.find_or_create_by(name: "Sun")
MOON = Planet.find_or_create_by(name: "Moon")
MERCURY = Planet.find_or_create_by(name: "Mercury")
VENUS = Planet.find_or_create_by(name: "Venus")
MARS = Planet.find_or_create_by(name: "Mars")
JUPITER = Planet.find_or_create_by(name: "Jupiter")
SATURN = Planet.find_or_create_by(name: "Saturn")
URANUS = Planet.find_or_create_by(name: "Uranus")
NEPTUNE = Planet.find_or_create_by(name: "Neptune")
PLUTO = Planet.find_or_create_by(name: "Pluto")

ARIES = Sign.find_or_create_by(name: "Aries", element: "Fire", quality: "Cardinal")
TAURUS = Sign.find_or_create_by(name: "Taurus", element: "Earth", quality: "Fixed")
GEMINI = Sign.find_or_create_by(name: "Gemini", element: "Air", quality: "Mutable")
CANCER = Sign.find_or_create_by(name: "Cancer", element: "Water", quality: "Cardinal")
LEO = Sign.find_or_create_by(name: "Leo", element: "Fire", quality: "Fixed")
VIRGO = Sign.find_or_create_by(name: "Virgo", element: "Earth", quality: "Mutable")
LIBRA = Sign.find_or_create_by(name: "Libra", element: "Air", quality: "Cardinal")
SCORPIO = Sign.find_or_create_by(name: "Scorpio", element: "Water", quality: "Fixed")
SAGITTARIUS = Sign.find_or_create_by(name: "Sagittarius", element: "Fire", quality: "Mutable")
CAPRICORN = Sign.find_or_create_by(name: "Capricorn", element: "Earth", quality: "Cardinal")
AQUARIUS = Sign.find_or_create_by(name: "Aquarius", element: "Air", quality: "Fixed")
PISCES = Sign.find_or_create_by(name: "Pisces", element: "Water", quality: "Mutable")
