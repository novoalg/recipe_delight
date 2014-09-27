class RecipesController < ApplicationController

	def new 
		@recipe = Recipe.new 
	end	

	def create 

	end

	def destroy

	end

	def edit 

	end

	def index

	end

	def update

	end

	private 

	def recipes_params
		params.require(:recipe).permit!
	end

end
