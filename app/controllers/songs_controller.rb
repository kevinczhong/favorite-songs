class SongsController < ApplicationController
  def index
    songs = Song.all
    render json: { songs: songs }
  end

  def show
    song = Song.find_by(id: params[:id])
    render json: { song: song }
  end

  def create
    song = Song.create(
      title: params["title"],
      album: params["album"],
      artist: params["artist"],
      year: params["year"]
    )
    
end
