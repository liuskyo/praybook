class PrayerCommentsController < ApplicationController
	before_action :set_prayer
	before_action :authenticate_user!



	def create
		@comment = @prayer.comments.build(comment_params)
		@comment.user = current_user

		if @comment.save
			redirect_to prayer_path(@prayer)
		else
			render redirect_to prayer_path(@prayer)
		end
	end


	def edit
		@comment = @prayer.comments.find(params[:id])
	end

	def update
		@comment = current_user.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to prayer_path(@prayer)
		else
		   render :action=>"edit"
		end

	end	

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		redirect_to prayer_path(@prayer)
	end


	private
	def set_prayer
    @prayer = Prayer.find( params[:prayer_id] )
  end

	def comment_params
		params.require(:comment).permit(:content)
		
	end	
end
