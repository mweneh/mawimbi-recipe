class SessionsController < ApplicationController
    skip_before_action :authorize, only: :login
  
    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        create_user_session(user.id, user.user_type)
        render json: user
      else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end
    end
  
    def logout
      delete_user_session
      head :no_content
    end

    private

    def create_user_session user_id, user_type
        session[:user_id] ||= user_id
        session[:user_type] ||= user_type
    end

    def delete_user_session
        session.delete :user_id
        session.delete :user_type
    end
  
end
