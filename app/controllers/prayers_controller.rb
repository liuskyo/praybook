class PrayersController < ApplicationController
	def index
    @prayer=Prayer.all
	end





















	  private

	def prayer_params
		params.require(:prayer).permit(:title,:content,:user_id,:category_id)
	end
end
