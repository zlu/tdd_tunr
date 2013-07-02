class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to :back
  end
end