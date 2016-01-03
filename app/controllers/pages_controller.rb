class PagesController < ApplicationController
  def home

	  if params[:current_folder_id].nil?
		  @links = Link.all.where(folder_id: nil)
      @folders = Folder.all.where(parent_id: nil)
      @media = Medium.all.where(id: 0)
      @metadata = Metadatum.all.where(id: 0)
      @technicals = Technical.all.where(id: 0)
	  else
		  @links = Link.all.where(folder_id: params[:current_folder_id])
      @folders = Folder.all.where(parent_id: params[:current_folder_id])
      @media = Medium.all.where(id: params[:current_medium_id])
      @metadata = Metadatum.all.where(medium_id: params[:current_medium_id])
      @technicals = Technical.all.where(medium_id: params[:current_medium_id])
	  end

  end
end
