class Admin::ApplicationDatesController < Admin::BaseController
  before_action :set_application_date, only: [:show, :edit, :update, :destroy]
  before_action :redirect_where_path, only: [:new, :edit]

  # GET /admin/application_dates
  # GET /admin/application_dates.json
  def index
    @application_dates = ApplicationDate.all
  end

  # GET /admin/application_dates/1
  # GET /admin/application_dates/1.json
  def show
  end

  # GET /admin/application_dates/new
  def new
    @application_date = ApplicationDate.new
  end

  # GET /admin/application_dates/1/edit
  def edit
  end

  # POST /admin/application_dates
  # POST /admin/application_dates.json
  def create
    @application_date = ApplicationDate.new(application_date_params)

    respond_to do |format|
      if @application_date.save
        format.html { redirect_to admin_home_path, notice: '时间阶段创建成功' }
        format.json { render action: 'show', status: :created, location: @application_date }
      else
        format.html { render action: 'new' }
        format.json { render json: @application_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/application_dates/1
  # PATCH/PUT /admin/application_dates/1.json
  def update
    respond_to do |format|
      if @application_date.update(application_date_params)
        format.html { redirect_to admin_home_path, notice: '时间阶段更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/application_dates/1
  # DELETE /admin/application_dates/1.json
  def destroy
    @application_date.destroy
    respond_to do |format|
      format.html { redirect_to application_dates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_date
      @application_date = ApplicationDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_date_params
      params.require(:application_date).permit(:start_at, :end_at)
    end

    def redirect_where_path
      application_date = ApplicationDate.first
      if application_date.present? && params[:action] == "new"
        redirect_to edit_admin_application_date_path(application_date)
      elsif application_date.nil? && params[:action] == "edit"
        redirect_to new_application_dates_path
      end
    end

end
