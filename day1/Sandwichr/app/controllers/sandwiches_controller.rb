class SandwichesController < ApplicationController
  def index
    sandwiches = Sandwich.all
    render json: sandwiches
  end

  def create
    sandwich = Sandwich.create sandwich_params
    render status: 201, json: sandwich
  end

  def show
    sandwich = Sandwich.find_by(id: params[:id])
    if sandwich
      render status: 200, json: sandwich
    else
      render status: 404, json: {error: "sandwich not found"}
    end
  end

  def update
    sandwich = Sandwich.find_by(id: params[:id])
    if sandwich
      sandwich.update sandwich_params
      render status: 200, json: sandwich
    else
      render status: 404, json: {error: "sandwich not found"}
    end
  end

  def destroy
    sandwich = Sandwich.find_by(id: params[:id])
    if sandwich
      sandwich.destroy
      render status: 204, json:sandwich
    else
      render status: 404, json: {error: "sandwich not found"}
    end
  end

  private
    def sandwich_params
      params.require(:sandwich).permit(:name, :bread_type)
    end

end
