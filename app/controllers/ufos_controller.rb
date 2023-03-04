class UfosController < ApplicationController
  before_action :set_ufo, only: %i[ show edit update destroy ]

  def index
    @ufos = Ufo.all
  end

  def show; end
  def edit; end

  def new
    @ufo = Ufo.new
  end

  def create
    @ufo = Ufo.new(ufo_params)
    respond_to do |format|
      if @ufo.save
        format.html { redirect_to ufo_url(@ufo) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ufo.update(ufo_params)
        format.html { redirect_to ufo_url(@ufo) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ufo.destroy
    respond_to do |format|
      format.html { redirect_to ufos_url }
    end
  end

  private
  def set_ufo
    @ufo = Ufo.find(params[:id])
  end

  def ufo_params
    params.require(:ufo).permit(
      :name,
      :status,
      :description
    )
  end
end
