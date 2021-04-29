class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    # @reviews = Review.all

    render json: get_reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: get_reviews, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: get_reviews
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    render json: get_reviews
  end

  private
  def get_reviews
    Review.order('created_at DESC')
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:name, :vehicle_name, :date_rented, :description, :rating)
    end
end
