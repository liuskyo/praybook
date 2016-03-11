class PrayersController < ApplicationController
		before_action :authenticate_user!,:except=>[:index]

	def index
    @prayer = Prayer.all
	end

	def show
		@prayer = Prayer.find(params[:id])
		@comments = @prayer.comments
  	@comment = Comment.new
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

  def edit
  	@prayer = current_user.prayers.find(params[:id])
  end

	def update
  	@prayer = current_user.prayers.find(params[:id])
  	@prayer.update(prayer_params)
  	redirect_to prayer_path(@prayer)
  end

  def destroy
  	@prayer = current_user.prayers.find(params[:id])
  	@prayer.destroy

  	redirect_to prayers_path
  end




  # POST /topics/:id/subscribe
  def subscribe
    @prayer = Prayer.find( params[:id] )
    @prayer.subscriptions.create!( :user => current_user )

    redirect_to :back
  end

  def unsubscribe
    @prayer = Prayer.find( params[:id] )
    current_user.subscriptions.where( :prayer_id => @prayer.id ).destroy_all

    redirect_to :back
  end








	  private

	def prayer_params
		params.require(:prayer).permit(:title,:content,:user_id,:category_id)
	end
end
