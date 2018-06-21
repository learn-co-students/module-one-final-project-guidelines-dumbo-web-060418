require 'bundler'
Bundler.require
require 'date'
require_all 'lib'
require_all 'app'
require_all 'art'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger.level = 1


CLIENT = VRClient.new(USER_ID, API_KEY)

SUN = Planet.find_or_create_by(name: "Sun", meaning: "Identity", ruler_of: "Leo")
MOON = Planet.find_or_create_by(name: "Moon", meaning: "Moods and Emotions", ruler_of: "Cancer")
MERCURY = Planet.find_or_create_by(name: "Mercury", meaning: "Intellect and Communication", ruler_of:"Gemini & Virgo")
VENUS = Planet.find_or_create_by(name: "Venus", meaning: "Love and Pleasure", ruler_of: "Taurus & Libra")
MARS = Planet.find_or_create_by(name: "Mars", meaning: "Drive and Aggression", ruler_of: "Scorpio & Aries")
JUPITER = Planet.find_or_create_by(name: "Jupiter", meaning: "Philosophy of Life", ruler_of: "Sagittarius")
SATURN = Planet.find_or_create_by(name: "Saturn", meaning: "Sense of Responsibility", ruler_of: "Capricorn & Aquarius")
URANUS = Planet.find_or_create_by(name: "Uranus", meaning: "Sense of Discovery and Progress", ruler_of: "Aquarius")
NEPTUNE = Planet.find_or_create_by(name: "Neptune", meaning: "Dreams and Inspiration", ruler_of: "Pisces")
PLUTO = Planet.find_or_create_by(name: "Pluto", meaning: "Sense of Control, Power, and Renewal", ruler_of: "Scorpio")

ARIES = Sign.find_or_create_by(name: "Aries", element: "Fire", quality: "Cardinal", ruled_by: "Mars")
TAURUS = Sign.find_or_create_by(name: "Taurus", element: "Earth", quality: "Fixed", ruled_by: "Venus")
GEMINI = Sign.find_or_create_by(name: "Gemini", element: "Air", quality: "Mutable", ruled_by: "Mercury")
CANCER = Sign.find_or_create_by(name: "Cancer", element: "Water", quality: "Cardinal", ruled_by: "Moon")
LEO = Sign.find_or_create_by(name: "Leo", element: "Fire", quality: "Fixed", ruled_by: "Sun")
VIRGO = Sign.find_or_create_by(name: "Virgo", element: "Earth", quality: "Mutable", ruled_by: "Mercury")
LIBRA = Sign.find_or_create_by(name: "Libra", element: "Air", quality: "Cardinal", ruled_by: "Venus")
SCORPIO = Sign.find_or_create_by(name: "Scorpio", element: "Water", quality: "Fixed", ruled_by: "Mars & Pluto")
SAGITTARIUS = Sign.find_or_create_by(name: "Sagittarius", element: "Fire", quality: "Mutable", ruled_by: "Jupiter")
CAPRICORN = Sign.find_or_create_by(name: "Capricorn", element: "Earth", quality: "Cardinal", ruled_by: "Saturn")
AQUARIUS = Sign.find_or_create_by(name: "Aquarius", element: "Air", quality: "Fixed", ruled_by: "Uranus")
PISCES = Sign.find_or_create_by(name: "Pisces", element: "Water", quality: "Mutable", ruled_by: "Neptune")
