class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  def move
    moved_folder_id = params[:folder_id]
    moved_link_id = params[:id]
    @link = Link.find(moved_link_id)
    @link.update_attributes(:folder_id => moved_folder_id)
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def duplicate
    duplicate_link_id = params[:id]
    @link = Link.find(duplicate_link_id)
    @new_link = Link.new(:medium_id => @link.medium_id, :folder_id => @link.folder_id)
    @new_link.save
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:medium_id, :folder_id)
    end
end
