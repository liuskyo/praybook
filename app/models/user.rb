class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prayers
  has_many :comments

  has_many :likes,:dependent => :destroy
 	has_many :liked_prayers, :through => :likes, :source => :prayer
 
  has_many :subscriptions,:dependent => :destroy
  has_many :subscribed_prayers, :through => :subscriptions, :source => :prayer



end
