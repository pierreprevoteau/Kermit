class Link < ActiveRecord::Base
  belongs_to :medium
  belongs_to :folder
  has_many :technical, through: :medium
end
