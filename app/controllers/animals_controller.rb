class AnimalsController < ApplicationController
  
  before_action :check_admin, only: [:edit, :create, :destroy, :new]

  def index
  	@animals = Animal.all
  end

  def new
  	@animal = Animal.new
  	@animal.stock = 0
  	@animal.av_weight = 0
  	@animal.latin_name = ""
  end

  def edit
  	@animal = Animal.find(params[:id])
  end

  def create
  	@animal = Animal.new(animals_params)
  	if @animal.save
  		redirect_to animals_url
  	else
  		render 'new'
  	end
  end

  def show
    @animals=[]
    @animals[0] = Animal.find(params[:id])
    render 'index'
  end

  def destroy
  end

  def update
  end

  private
  def animals_params
  	params.require(:animal).permit(:name, :latin_name, :av_weight, :stock)
  end
end
