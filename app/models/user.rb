class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :events
  has_one :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
