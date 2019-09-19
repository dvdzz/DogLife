class DogsController < ApplicationController
    def index
        @dogs = Dog.order(:id).paginate(:page => params[:page], :per_page => 5) 
    end

    def new
        @dog = Dog.new
    end

    def create
        Dog.create(dog_params)
        redirect_to root_path
      end
    
      private
    
      def dog_params
        params.require(:dog).permit(:name, :caption)
      end
    
    end
