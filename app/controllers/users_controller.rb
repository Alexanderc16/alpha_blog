class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Account was successfully updated"
            redirect_to articles_path
        else
            render 'edit'
        end
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
            flash[:success] = "Welcome to Alpha-Blog #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end