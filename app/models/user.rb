class User < ActiveRecord::Base
  has_many :medium
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
