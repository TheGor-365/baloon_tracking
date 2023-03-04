class CoordinatesController < ApplicationController
  before_action :set_coordinate, only: %i[ show edit update destroy ]

  def index
    @coordinates = Coordinate.all
  end

  def show; end
  def edit; end

  def new
    @coordinate = Coordinate.new
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    respond_to do |format|
      if @coordinate.save
        format.html { redirect_to coordinate_url(@coordinate) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @coordinate.update(coordinate_params)
        format.html { redirect_to coordinate_url(@coordinate) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @coordinate.destroy
    respond_to do |format|
      format.html { redirect_to coordinates_url }
    end
  end

  private
  def set_coordinate
    @coordinate = Coordinate.find(params[:id])
  end

  def coordinate_params
    params.require(:coordinate).permit(:lat, :long, :sighting_id)
  end
end
