class Folder < ActiveRecord::Base
  has_many :link
  has_many :medium, through: :link
end
