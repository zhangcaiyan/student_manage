class Student::ScoresController < Student::BaseController
  before_action :set_student_score, only: [:show, :edit, :update, :destroy]

  # GET /student/scores
  # GET /student/scores.json
  def index
    @student_scores = current_user.scores.page(params[:page]).per_page(10)
  end

  # GET /student/scores/1
  # GET /student/scores/1.json
  def show
  end

  # GET /student/scores/new
  def new
    @student_score = current_user.scores.new
  end

  # GET /student/scores/1/edit
  def edit
  end

  # POST /student/scores
  # POST /student/scores.json
  def create
    @student_score = current_user.scores.new(student_score_params)

    respond_to do |format|
      if @student_score.save
        format.html { redirect_to student_scores_url, notice: '成绩保存成功' }
        format.json { render action: 'show', status: :created, location: @student_score }
      else
        format.html { render action: 'new' }
        format.json { render json: @student_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student/scores/1
  # PATCH/PUT /student/scores/1.json
  def update
    respond_to do |format|
      if @student_score.update(student_score_params)
        format.html { redirect_to student_scores_url, notice: '成绩更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student/scores/1
  # DELETE /student/scores/1.json
  def destroy
    @student_score.destroy
    respond_to do |format|
      format.html { redirect_to student_scores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_score
      @student_score = current_user.scores.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_score_params
      params.require(:score).permit(:category_id, :xueqi_id, :subject_id, :score_id, :user_id, :pingjun_score, :caoxing, :xuenian_id)
    end
end
