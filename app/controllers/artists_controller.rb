class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to :back
  end
end