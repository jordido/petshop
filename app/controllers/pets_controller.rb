class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :buy]
  before_action :check_admin, only: [:edit, :create, :destroy, :new]

	def index
		@pets = Pet.all
	end

  def new
  	@pet = Pet.new
		@pet.name = "new pet"
  end

  def edit
    ## @pet= Pet.find(params[:id])
    ## I don't need previous line because of the before_action atthe beginning
  end

  def update
    @pet = Pet.find(params[:id])
    ## update with params from browser
    if @pet.update(pet_params)
      redirect_to pets_url
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
  end

  def buy
    ## @pet= Pet.find(params[:id])
    ## I don't need previous line because of the before_action atthe beginning
    @pet.user_id = current_user.id
    @pet.save
    @animal = Animal.find(@pet.animal_id)
    @animal.stock -= 1
    @animal.save
    redirect_to pets_url(notice="Pet bought and stock updated")
  end

  def create
  	@pet = Pet.new(pet_params)
		if @pet.save
			redirect_to pets_url
		else
			## display the "new.html.erb" template with the @customer variable
 			render :new
		end
  end

  private
  def pet_params
  	params.require(:pet).permit(:name, :user_id, :animal_id)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
