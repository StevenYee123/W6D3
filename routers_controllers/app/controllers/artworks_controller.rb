class ArtworksController < ApplicationController
  def index
    artworks_owned = Artwork.find_by(artist_id: params[:user_id])

    if artworks_owned.nil?
      render json: Artwork.all 
    else
      render json: Artwork.get_my_artworks(params[:user_id])
      #Check the class method in Artwork!!!
    end
    
  end

  def create 
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    
    render json: artwork
  end

  def update 
    artwork = Artwork.find(params[:id])
    debugger
    if artwork.update(artwork_params)
      redirect_to artworks_url, status: 303
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy 
      redirect_to artworks_url, status: 303

  end

  private
    def artwork_params
      params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end