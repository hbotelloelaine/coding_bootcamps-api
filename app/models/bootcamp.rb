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
    bootcamp_hashes = Unirest.get("http://localhost:3000/camps.json").body
    bootcamp_hashes.each do |bootcamp_hash|
      bootcamp << Bootcamp.new(bootcamp_hash)
    end
    return bootcamp
  end

  def self.find(id)
    bootcamp_hash = Unirest.get("http://localhost:3000/camps/#{id}.json").body
    Bootcamp.new(bootcamp_hash)
  end

  def self.create
     @bootcamp= Unirest.post("http://localhost:3000/camps.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], location: params[:location], duration: params[:duration], price: params[:price]}).body
  end

  def destroy(params)
    bootcamp = Unirest.delete("http://localhost:3000/camps/#{id}.json").body
  end
end
 