class DogsController < ApplicationController
    def index
        @dogs = Dog.order(:id).paginate(:page => params[:page], :per_page => 5) 
    end
end
