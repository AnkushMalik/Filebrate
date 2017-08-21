class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /folders
  # GET /folders.json
  def index
    @folders = current_user.folders
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    if ( @folder.nil? || @folder.user_id!=current_user.id)
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  # GET /folders/new
  def new
    @folder = current_user.folders.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folders.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    #@folder = current_user.folders.find(folder_params)
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name,:user_id)
    end
end
