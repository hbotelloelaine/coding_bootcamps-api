class Bootcamp

  attr_accessor :name, :location, :duration, :price

  def initialize(hash)
    @name = hash["name"]
    @location = hash["location"]
    @duration = hash["duration"]
    @price = hash["price"]
  end


  def self.all
    bootcamp = []
    bootcamp_hashes = Unirest.get("#{ENV['API_BASE_URL']}/camps.json", headers: {"X-User-Email": "test@test.com", "Authorization": "Token token=test"}).body
    bootcamp_hashes.each do |bootcamp_hash|
      bootcamp << Bootcamp.new(bootcamp_hash)
    end
    return bootcamp
  end

  def self.find(id)
    bootcamp_hash = Unirest.get("#{ENV['API_BASE_URL']}/camps/#{id}.json").body
    Bootcamp.new(bootcamp_hash)
  end

  def self.create(attributes)
     bootcamp_hash = Unirest.post("#{ENV['API_BASE_URL']}/camps.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
  end

  def update(attributes)
    bootcamp_hash = Unirest.patch("#{ENV['API_BASE_URL']}/camps/#{id}.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    bootcamp.new(bootcamp_hash)
  end

  def destroy(params)
    Unirest.delete("#{ENV['API_BASE_URL']}/camps/#{id}.json").body
  end
end
 