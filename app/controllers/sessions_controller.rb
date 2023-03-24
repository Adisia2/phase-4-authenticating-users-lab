class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        render json: user
    end

    # DELETE /logout
    def destroy
        session.delete :user_id
        head :no_content
    end
end
    # class SessionsController < ApplicationController
    #     def create
    #       user = User.find_by(username: params[:username])
      
    #       if user && user.authenticate(params[:password])
    #         session[:user_id] = user.id
    #         render json: { id: user.id, username: user.username }
    #       else
    #         render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    #       end
    #     end
      
    #     def destroy
    #       session[:user_id] = nil
    #       head :no_content
    #     end
    #   end