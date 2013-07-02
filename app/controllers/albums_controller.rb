class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to :back
  end

  # custom action to purchase a given album
  def purchase
    album = Album.find(params[:id])
    # we have not added authentication yet
    # current_user.purchase(album) unless album.in?(current_user.albums)
    redirect_to album
  end

end