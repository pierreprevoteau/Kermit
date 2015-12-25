class Link < ActiveRecord::Base
  belongs_to :medium
  belongs_to :folder
end
