class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts, dependent: :destroy
  
  validates_presence_of :username
  validates_uniqueness_of :username
  
  validates_presence_of :name
  
  def feed
    Post.where('user_id = ?', id)
  end
end
