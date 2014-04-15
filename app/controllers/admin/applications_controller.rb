class Admin::ApplicationsController < Admin::BaseController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /admin/applications
  # GET /admin/applications.json
  def index
    @applications = ::Application.all
  end

  # GET /admin/applications/1
  # GET /admin/applications/1.json
  def show
  end

  # GET /admin/applications/new
  def new
    @application = ::Application.new
  end

  # GET /admin/applications/1/edit
  def edit
  end

  # POST /admin/applications
  # POST /admin/applications.json
  def create
    @application = ::Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to admin_applications_path, notice: '奖励 创建成功' }
        format.json { render action: 'show', status: :created, location: @application }
      else
        format.html { render action: 'new' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/applications/1
  # PATCH/PUT /admin/applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to admin_applications_path, notice: '奖励 更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/applications/1
  # DELETE /admin/applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to admin_applications_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = ::Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:name)
    end
end
