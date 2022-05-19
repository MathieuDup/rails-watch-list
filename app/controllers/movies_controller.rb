class MoviesController < ApplicationController
  before_action :find_movies, only: %i[show edit update destroy]

  def index
    @movies = Movie.all
  end

  def show
    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    redirect_to movie_edit
  end

  def update
    @movie.update(movie_params)

    redirect_to movies_path
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def find_movies
    @movie = movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
