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
      year: params["year"],
    )
    render json: { song: song }
  end

  def update
    song = Song.find_by(id: params[:id])
    song.update(
      title: params["title"] || song.title,
      album: params["album"] || song.album,
      artist: params["artist"] || song.artist,
      year: params["year"] || song.year,
    )
    song.save
    render json: { song: song }
  end
end
