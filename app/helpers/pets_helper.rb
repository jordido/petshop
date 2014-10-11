module PetsHelper

	def buy_pet_link (pet)
		@pet.user_id = current_user.id
    @pet.save
    @animal = Animal.find(@pet.animal_id)
    @animal.stock -= 1
    @animal.save
	end

end
