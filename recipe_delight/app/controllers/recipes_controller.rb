class RecipesController < ApplicationController

	def new 
		@recipe = Recipe.new 
	end	

	def create 
		@recipe = Recipe.create(recipes_params)
		logger.info "************** #{params.inspect}"	
		@recipe.author_id = current_user.id
		if @recipe.save
			flash[:success] = "You saved a Recipe!"
			redirect_to @recipe 
		else 
			flash[:error] = @recipe.errors.full_messages.to_sentence
			@recipe.destroy
			render 'new'
		end 

	end

	def destroy

	end

	def edit 
		@recipe = Recipe.find(params[:id])
	end

	def index
		@recipes =Recipe.paginate(:page => params[:page], :per_page => 10 ) 
	end

	def update
		logger.info "**************** #{params.inspect}"
		@recipe = Recipe.find(params[:id]) 
		@recipe.author_id = current_user.id
		if @recipe.update_attributes(recipes_params) 
			flash[:success] = "You updated your recipe!"
			redirect_to @recipe
		else 
			flash[:error] = "There was an error updating your Recipe."
			render 'edit'
		end
	end

	private 

	def recipes_params
		params.require(:recipe).permit!
	end

end
