class Prayer < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments

	has_many :likes,:dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user
 
  has_many :subscriptions,:dependent => :destroy
  has_many :subscribed_users, :through => :subscriptions, :source => :user





  def find_my_subscription(u)
    if u
      self.subscriptions.where( :user_id => u.id ).first
    else
      nil
    end
  end


	def find_my_like(u)
     if u
       self.likes.where( :user_id => u.id ).first
     else
       nil
     end
  end





end
