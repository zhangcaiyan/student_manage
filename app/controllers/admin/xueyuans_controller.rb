class Admin::XueyuansController < Admin::BaseController
  before_action :set_xueyuan, only: [:show, :edit, :update, :destroy]

  # GET /admin/xueyuans
  # GET /admin/xueyuans.json
  def index
    @xueyuans = Xueyuan.all
  end

  # GET /admin/xueyuans/1
  # GET /admin/xueyuans/1.json
  def show
  end

  # GET /admin/xueyuans/new
  def new
    @xueyuan = Xueyuan.new
  end

  # GET /admin/xueyuans/1/edit
  def edit
  end

  # POST /admin/xueyuans
  # POST /admin/xueyuans.json
  def create
    @xueyuan = Xueyuan.new(xueyuan_params)

    respond_to do |format|
      if @xueyuan.save
        format.html { redirect_to admin_xueyuans_url, notice: '学院创建成功' }
        format.json { render action: 'show', status: :created, location: @xueyuan }
      else
        format.html { render action: 'new' }
        format.json { render json: @xueyuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/xueyuans/1
  # PATCH/PUT /admin/xueyuans/1.json
  def update
    respond_to do |format|
      if @xueyuan.update(xueyuan_params)
        format.html { redirect_to admin_xueyuans_url, notice: '学院更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @xueyuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/xueyuans/1
  # DELETE /admin/xueyuans/1.json
  def destroy
    @xueyuan.destroy
    respond_to do |format|
      format.html { redirect_to admin_xueyuans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xueyuan
      @xueyuan = Xueyuan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xueyuan_params
      params.require(:xueyuan).permit(:name)
    end
end
