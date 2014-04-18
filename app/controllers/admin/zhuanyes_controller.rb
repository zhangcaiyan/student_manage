class Admin::ZhuanyesController < Admin::BaseController
  before_action :set_zhuanye, only: [:show, :edit, :update, :destroy]

  # GET /admin/zhuanyes
  # GET /admin/zhuanyes.json
  def index
    @zhuanyes = Zhuanye.page(params[:page]).per_page(10)
  end

  # GET /admin/zhuanyes/1
  # GET /admin/zhuanyes/1.json
  def show
  end

  # GET /admin/zhuanyes/new
  def new
    @zhuanye = Zhuanye.new
  end

  # GET /admin/zhuanyes/1/edit
  def edit
  end

  # POST /admin/zhuanyes
  # POST /admin/zhuanyes.json
  def create
    @zhuanye = Zhuanye.new(zhuanye_params)

    respond_to do |format|
      if @zhuanye.save
        format.html { redirect_to admin_zhuanyes_path, notice: '专业创建成功' }
        format.json { render action: 'show', status: :created, location: @zhuanye }
      else
        format.html { render action: 'new' }
        format.json { render json: @zhuanye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/zhuanyes/1
  # PATCH/PUT /admin/zhuanyes/1.json
  def update
    respond_to do |format|
      if @zhuanye.update(zhuanye_params)
        format.html { redirect_to admin_zhuanyes_path, notice: '专业更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @zhuanye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/zhuanyes/1
  # DELETE /admin/zhuanyes/1.json
  def destroy
    @zhuanye.destroy
    respond_to do |format|
      format.html { redirect_to admin_zhuanyes_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zhuanye
      @zhuanye = Zhuanye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zhuanye_params
      params.require(:zhuanye).permit(:name, :xueyuan_id)
    end
end
