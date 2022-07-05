class ScientistsController < ApplicationController
  def index
    render json: Scientist.all
  end

  def show
    render json: find_scientist, serializer: ScientistPlanetsSerializer
  end

  private

  def find_scientist
    Scientist.find(params[:id])
  end
end
