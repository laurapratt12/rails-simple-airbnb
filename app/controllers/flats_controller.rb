class FlatsController < ApplicationController
before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
      @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable
    end

  end

  def show
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flats_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
  @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
  end

end
