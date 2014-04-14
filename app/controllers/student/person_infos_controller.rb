class Student::PersonInfosController < Student::BaseController
  before_action :set_person_info, only: [:show, :edit, :update, :destroy]
  before_action :redirect_where_path, only: [:new, :edit]
  skip_before_action :check_person_info, only: [:new, :create]


  def show
  end

  # GET /student/person_infos/new
  def new
    @person_info = current_user.build_person_info
  end

  # GET /student/person_infos/1/edit
  def edit
  end

  # POST /student/person_infos
  # POST /student/person_infos.json
  def create
    @person_info = current_user.build_person_info(person_info_params)

    respond_to do |format|
      if @person_info.save
        format.html { redirect_to student_home_path, notice: '个人信息创建成功' }
        format.json { render action: 'show', status: :created, location: @person_info }
      else
        format.html { render action: 'new' }
        format.json { render json: @person_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student/person_infos/1
  # PATCH/PUT /student/person_infos/1.json
  def update
    respond_to do |format|
      if @person_info.update(person_info_params)
        format.html { redirect_to student_home_path, notice: '个人信息更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person_info.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_info
      @person_info = PersonInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_info_params
      params.require(:person_info).permit(:name, :gender_id, :xuehao, :zhuanye, :zhiwu, :minzu, :political_id, :score_id, :user_id, :state)
    end

    def redirect_where_path
      if current_person_info && params[:action] == "new"
        redirect_to edit_student_person_info_path(current_person_info)
      elsif current_person_info.nil? && params[:action] == "edit"
        redirect_to new_student_person_infos_path
      end
    end
end
