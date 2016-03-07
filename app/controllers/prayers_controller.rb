class PrayersController < ApplicationController
		before_action :authenticate_user!,:except=>[:index]

	def index
    @prayer = Prayer.all
	end

	def new
		@prayer = Prayer.new
	end

	def create
		@prayer = Prayer.new(prayer_params)
  	@prayer.user = current_user

  	if @prayer.save
  		redirect_to prayers_path #tell browser http code:303
  	else
  		render prayers_path
  	end
	end















	  private

	def prayer_params
		params.require(:prayer).permit(:title,:content,:user_id,:category_id)
	end
end
