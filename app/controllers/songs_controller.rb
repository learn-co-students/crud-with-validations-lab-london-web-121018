class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end
    
  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render 'new'
    end
  end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      # redirect_to edit_song_path(@song)
      render "edit"
    end
  end

  def destroy
    find_song
    @song.destroy
    redirect_to songs_path
  end

  





  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :release_year, :genre, :released, :artist_name)
  end
end
