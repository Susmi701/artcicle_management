class UsersController < ApplicationController
    before_action :authenticate_user!,only: [:destroy]
    before_action :set_user,only: [:show,:destroy]
    before_action :require_same_user,only:[:destroy]

    def show   
        @articles =@user.articles.paginate(page: params[:page], per_page: 5)
    end

  def index
    @users=User.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    if @user.destroy
        flash[:notice] = "User and associated data were successfully deleted."
    else
        flash[:alert] = "There was a problem deleting the user."
    end
    redirect_to root_path
    end

private

def set_user
    @user =User.find(params[:id])
  end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert]="Only author can edit or delete this article"
            redirect_to @article
        end
    end    
end
