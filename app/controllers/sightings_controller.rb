class SightingsController < ApplicationController

  def index 
  sightings = Sighting.all
  render json: sightings.to_json(include: [:bird, :location])
  end 
  def show
    #binding.pry
    #sighting = Sighting.find_by(id: params[:id])
    #render json: sighting

    #sighting = Sighting.find_by(id: params[:id])
    #render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

    #sighting = Sighting.find_by(id: params[:id])
    #render json: sighting, include: [:bird, :location]

    #sighting = Sighting.find_by(id: params[:id])
    #render json: sighting.to_json(include: [:bird, :location])
    #render json: sighting, include: [:bird, :location], except: [:updated_at, :created_at]

    sighting = Sighting.find_by(id: params[:id])
    render json: sighting.to_json(:include => {
    :bird, :only => [:name, :species],
    :location, :only => [:latitude, :longitude]}, 
    :except => [:updated_at])
  end 

end
