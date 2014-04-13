class Admin::UsersController < Admin::BaseController

  def index
    @users = User.page(params[:page]).per_page(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: '用户创建成功'
    else
      render action: "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: '用户更新成功'
    else
      render action: "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :category)
  end
end
