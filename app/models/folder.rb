class Folder < ActiveRecord::Base
  has_closure_tree
  has_many :link
  has_many :medium, through: :link
end
