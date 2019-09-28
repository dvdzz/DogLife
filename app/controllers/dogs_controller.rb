class DogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


    def index
        @dogs = Dog.order(:id).paginate(:page => params[:page], :per_page => 5) 
    end

    def new
        @dog = Dog.new
    end

    def create
      @dog = current_user.dogs.create(dog_params)
        if @dog.valid?
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
     end

      def show
        @dog = Dog.find(params[:id])
      end

      def edit
        @dog = Dog.find(params[:id])

        if @dog.user != current_user
          return render plain: 'Not Allowed', status: :forbidden
        end
      end

      def update
        @dog = Dog.find(params[:id])

        if @dog.user != current_user
          return render plain: 'Not Allowed', status: :forbidden
        end
        @dog.update_attributes(dog_params)
        if @dog.valid?
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @dog = Dog.find(params[:id])
        if @dog.user != current_user
          return render plain: 'Not Allowed', status: :forbidden
        end

        @dog.destroy 
        redirect_to root_path
      end
    
      private
    
      def dog_params
        params.require(:dog).permit(:name, :caption)
      end
    
    end
