require 'open-uri'

class Api::UsersController < ApplicationController
    def index
        @users = User.all
        render "api/users/index"
    end

    def create
        @user = User.new(user_params)
        @user[:tag] = rand(1000..9999) # make sure the tag isnt already used with  the same username, user Activerecord query.
        if @user.save
            file = open('https://app-amica-seeds.s3.amazonaws.com/poro_demo.jpeg')
            @user.avatar.attach(io: file, filename: 'poro_demo.jpeg')
            sign_in!(@user)
            render "api/users/show"
        else
            render json: ["- Password is too weak or common to use"], status: 422
            #@user.errors.full_messages
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render "api/users/show"
    end

    def update
        if current_user
            if @current_user.is_password?(user_params[:password])
                 @current_user.update(user_params)
            else
                render json: [["CURRENT PASSWORD", "Password does not match."]], status: 422
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :username, :dob)
    end

end
