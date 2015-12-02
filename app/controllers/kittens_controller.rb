class KittensController < ApplicationController
	before_action :set_kitten, only: [:show, :edit, :update, :destroy]
	
	def index
		@kittens = Kitten.all
	end

	def new 
		@kitten = Kitten.new
	end

	def create 
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			redirect_to @kittens 
		end 
	end

	def show; end

	private 

	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end

	def set_kitten
		@kitten = Kitten.find(params[:id])
	end
end
