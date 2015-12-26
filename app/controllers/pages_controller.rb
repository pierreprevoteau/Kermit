class PagesController < ApplicationController
  def home
    @folders = Folder.all.where(parent: 0)
    @links = Link.all
  end
end
