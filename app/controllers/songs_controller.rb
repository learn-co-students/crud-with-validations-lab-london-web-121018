class SongsController < ApplicationController
    before_action :song_find, only: [:show, :edit, :update, :destroy]


    def index
        # binding.pry
        @songs = Song.all
    end

    def show
        
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        
    end

    def update
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        Song.destroy(@song.id)
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
    
    def song_find
        @song = Song.find(params[:id])
    end
end
