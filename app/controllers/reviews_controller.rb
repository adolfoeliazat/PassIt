class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new
    @review.item_id = params[:item_id]
    @review.user_id = current_user.id
    @review.body = params[:body]
    if @review.save
      redirect_to items_url, notice: 'Your review has been successfully posted.'
    else
      redirect_to items_url, alert: 'An error has occurred.'
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :item_id, :body)
    end
end
