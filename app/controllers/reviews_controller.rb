 class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  # Only a signed in user can write a review, thats what the line below does
  before_action :authenticate_user!


  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    # When a user writes a new review they will get an ID with it
    @review.user_id = current_user.id
    @review.movie_id = @movie.id

      if @review.save
        redirect_to @movie
      else
        render 'new'
      end
    end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end


    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
