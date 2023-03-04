class SightingsController < ApplicationController
  before_action :set_sighting, only: %i[ show edit update destroy ]

  def index
    @sightings = Sighting.all
  end

  def show; end
  def edit; end

  def new
    @sighting = Sighting.new
    @sighting.coordinates.build
  end

  def create
    @sighting = Sighting.new(sighting_params)
    respond_to do |format|
      if @sighting.save
        format.html { redirect_to sighting_url(@sighting) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @sighting.update(sighting_params)
        format.html { redirect_to sighting_url(@sighting) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @sighting.destroy
    respond_to do |format|
      format.html { redirect_to sightings_url }
    end
  end

  private
  def set_sighting
    @sighting = Sighting.find(params[:id])
  end

  def sighting_params
    params.require(:sighting).permit(
      :date,
      :time,
      :ufo_id,
      coordinates_attributes: %[ id lat long _destroy ]
    )
  end
end
