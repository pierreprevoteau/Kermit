class Folder < ActiveRecord::Base
  has_closure_tree
  has_many :link
  has_many :medium, through: :link

  def self.json_tree(folder)
    folder.map do |folder, sub_folder|
      {:text => folder.title, :href => "home?current_folder_id=" << (folder.id).to_s, :nodes => Folder.json_tree(sub_folder).compact}
    end
  end

end
