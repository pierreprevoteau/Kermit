class Medium < ActiveRecord::Base
  belongs_to :sort
  belongs_to :tag
  belongs_to :state
  has_many :link
  has_many :folder, through: :link
  has_many :technical
  has_many :metadatum
end
