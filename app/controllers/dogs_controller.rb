class DogsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]


    def index
        @dogs = Dog.order(:id).paginate(:page => params[:page], :per_page => 5) 
    end

    def new
        @dog = Dog.new
    end

    def create
        current_user.dogs.create(dog_params)
        redirect_to root_path
      end

      def show
        @dog = Dog.find(params[:id])
      end

      def edit
        @dog = Dog.find(params[:id])
      end

      def update
        @dog = Dog.find(params[:id])
        @dog.update_attributes(dog_params)
        redirect_to root_path
      end

      def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy 
        redirect_to root_path
      end
    
      private
    
      def dog_params
        params.require(:dog).permit(:name, :caption)
      end
    
    end
