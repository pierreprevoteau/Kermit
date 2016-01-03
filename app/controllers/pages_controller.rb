class PagesController < ApplicationController
  def home

	  if params[:current_folder_id].nil?
		  @links = Link.all.where(folder_id: nil)
      @folders = Folder.all.where(parent_id: nil)
	  else
		  @links = Link.all.where(folder_id: params[:current_folder_id])
      @folders = Folder.all.where(parent_id: params[:current_folder_id])
	  end

  end
end
