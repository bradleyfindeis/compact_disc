class AlbumsController < ApplicationController
  before_action :set_artist
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = @artist.albums
  end

  def show
  end

  def new
    @album = @artist.albums.new

  end

  def edit


  end

  def create
    @album = @artist.albums.new(album_params)

    if @album.save
      redirect_to [@artist, @album]
    else
      render :new
    end
  end

  def update
    if @album.update(album_params)
      redirect_to [@artist, @album]
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to artist_albums_path
  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :year, :description)
    end
end