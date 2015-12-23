class Medium < ActiveRecord::Base
  belongs_to :folder
  belongs_to :sort
  belongs_to :tag
  belongs_to :state
  has_many :technical
	has_many :metadatum
end
