class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :edit, :update, :destroy]

  
        def index
            @dogs = Dog.all
        end
    
        def show
        end
    
        def new 
            @dog = Dog.new 
        end
    
        def create
            @dog = Dog.new(dog_params)
    
            if  @dog.valid? 
                @dog.save
                redirect_to @dog
            else 
                flash[:errors] = @dog.errors.full_messages
                redirect_to new_employee_path    
            end
    
        end
    
        def edit 
            
        end
    
        def update 
            if @dog.update(dog_params)
                redirect_to @dog
            else 
                flash[:errors] = @dog.errors.full_messages
                redirect_to edit_dog_path
            end
        end

        def destroy

            @dog.destroy
            redirect_to dogs_path
          end
    
    
        private 
    
        def find_dog
            @dog = Dog.find(params[:id])
        end
    
        def dog_params
            params.require(:dog).permit(:name, :age, :city, :breed, :bio, :temperament, :picture)
        end
end
