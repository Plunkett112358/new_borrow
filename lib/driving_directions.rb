class DrivingDirections
  attr_accessor :response
  def initialize(options)
    @start = options[:start]
    @ending = options[:ending]
  end
  def url

    @url = "https://montanaflynn-mapit.p.mashape.com/directions?starting=#{@start.gsub(" ", "%20")}&ending=#{@ending.gsub(" ", "%20")}"
  end
  def go!
    @response = Unirest::get(url, headers: {"X-Mashape-Authorization" => "pNMqKdhb94S2zg2jLbX7c4FBnNbZFfFo"}).body
    self
  end
  def duration
    @response["duration"]
  end
  def distance
    @response["distance"]
  end
  def self.go!(options)
    self.new(options).go!
  end
end
