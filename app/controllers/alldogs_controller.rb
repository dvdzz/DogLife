class AlldogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

end
