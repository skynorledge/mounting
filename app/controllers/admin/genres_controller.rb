class Admin::GenresController < ApplicationController
  
  before_action :authenticate_admin!

  def create

    @genre = Genre.new(genre_params)

    @genre.save

    redirect_to admin_genres_path(@genre)

  end

  def index

    @genres = Genre.all
    @genre = Genre.new

  end

  def show

    @genres = Genre.all
    @genre = Genre.new

  end

  def edit

    @genre = Genre.find(params[:id])

  end

  def update

  end




  private
    def genre_params
      params.require(:genre).permit(:name)
    end





end
