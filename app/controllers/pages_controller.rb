class PagesController < ApplicationController
  def home
    unc_url = "http://0.0.0.0:3000/"
    unc_base = "STORAGE/"
    unc_letter = "A/"

    if params[:current_medium_id].nil?
    current_medium_id = "0"
    else
    current_medium_id = params[:current_medium_id]
    end

	  if params[:current_folder_id].nil?
		  @links = Link.all.where(folder_id: nil)
      @folders = Folder.all.where(parent_id: nil)
      @media = Medium.all.where(id: 0)
      @current_media_path = "0"
      @metadata = Metadatum.all.where(id: 0)
      @technicals = Technical.all.where(id: 0)
	  else
		  @links = Link.all.where(folder_id: params[:current_folder_id])
      @folders = Folder.all.where(parent_id: params[:current_folder_id])
      @media = Medium.all.where(id: params[:current_medium_id])
      @current_media_path = unc_url + unc_base + unc_letter + "/1000/" + current_medium_id + "/LR_" + current_medium_id + ".mp4"
      @metadata = Metadatum.all.where(medium_id: params[:current_medium_id])
      @technicals = Technical.all.where(medium_id: params[:current_medium_id])
	  end

  end
end
