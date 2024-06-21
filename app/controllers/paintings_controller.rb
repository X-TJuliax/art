class PaintingsController < ApplicationController
    def index
        @paintings = Painting.all
    end

    def show
        @painting = Painting.find(params[:id])
    end

    def new
        @painting = Painting.new
        @artists = Artist.all
        @galleries = Gallery.all
        


    end

    def create
        @painting = Painting.new(painting_params)
        if @painting.save
           redirect_to @painting
        else
            @artists = Artist.all
            @galleries = Gallery.all 
            render :new
        end
        
      end
      

    def destroy
        @painting = Painting.find(params[:id])
        @painting.destroy

        redirect_to paintings_path
    end

    private

    def painting_params
        params.require(:painting).permit(:name, :price, :artist_id, :gallery_id)
    end

end
