class ScientistsController < ApplicationController
  def index
    render json: Scientist.all
  end

  def show
    render json: find_scientist, serializer: ScientistPlanetsSerializer
  end

  def create
    new_scientist = Scientist.create!(scientist_params)
    render json: new_scientist, status: 201
  end

  def update
    scientist = find_scientist
    scientist.update!(scientist_params)
    render json: scientist, status: 202
  end

  def destroy
    find_scientist.destroy
    head :no_content
  end

  private

  def find_scientist
    Scientist.find(params[:id])
  end

  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end
end
