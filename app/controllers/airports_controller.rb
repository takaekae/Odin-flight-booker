class AirportsController < ApplicationController
  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)

    if @airport.save
      redirect_to @airport
    else
      render :new, status: unprocessable_entity
    end
  end

  private
  def airport_params
    params.require(:airport).permit(:code)
  end
end
