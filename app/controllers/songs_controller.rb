class SongsController < ApplicationController
  before_action :set_album

  def new
    @song = Song.new
  end

  def create
    @song = @album.song.new(song_params)
    if @song.save
      redirect_to artist_album_path(@album.artist_id, @album)
    else
      render :new
    end
  end

  private
  def set_album
    @album = Album.find(params[:album_id])
  end


    def song_params
      params.require(:song).permit(:name, :length)
    end
end
