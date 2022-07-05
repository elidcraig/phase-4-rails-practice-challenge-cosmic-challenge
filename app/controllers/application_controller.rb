class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  private

  def handle_invalid e
    render json: { errors: ["validation errors"] }, status: 422
  end

  def handle_not_found e
    render json: { error: "#{e.model} not found" }, status: 404
  end
end
