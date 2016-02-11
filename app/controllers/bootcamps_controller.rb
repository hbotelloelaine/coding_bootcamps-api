class BootcampsController < ApplicationController
  def index
    @bootcamps = Bootcamp.all
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  def new
  end
  def create
    @bootcamp = Bootcamp.create(name: params[:name], loctation: params[:location], duration: params[:duration], price: params[:price])
    redirect_to "/bootcamps/#{@bootcamp.id}"
  end

  # def create
  #   @bootcamp= Unirest.post("http://localhost:3000/camps.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], location: params[:location], duration: params[:duration], price: params[:price]}).body
  #   redirect_to "/camps/#{@camp["id"]}"
  # end

  def edit
    @bootcamp = Unirest.get("http://localhost:3000/camps/#{params[:id]}.json").body
  end

  def update
    @bootcamp= Unirest.patch("http://localhost:3000/camps/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], location: params[:location], duration: params[:duration], price: params[:price]}).body
    redirect_to "/camps/#{@camp["id"]}"
  end

  def destroy
    @bootcamp = Bootcamp.delete(params[:id])
    # Unirest.delete("http://localhost:3000/camps/#{params[:id]}.json").body
    # redirect_to "/camps"
  end
end

