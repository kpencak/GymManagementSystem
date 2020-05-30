module Api
    module V1
        class UsersController < ApplicationController
            def index
                respond_to do |format|
                    @users = User.all.order('created_at DESC');

                    format.json { render json: {status: 'SUCCESS', message: 'Loaded users', data:@users}, status: :ok }
                    format.html
                end
            end

            def show
                respond_to do |format|
                    @user = User.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded user', data:@user}, status: :ok}
                    format.html
                end
            end

            def new
                @user = User.new 
            end

            def create
                respond_to do |format|
                    
                    @user = User.new(user_params)

                    if @user.save 
                        format.json {render json: {status: 'SUCCESS', message: 'Saved user', data:@user}, status: :ok}
                        format.html {redirect_to api_v1_users_path}
                    else
                        format.json {render json: {status: 'ERROR', message: 'User not saved', data:@user.errors}, status: :unprocessable_entity}
                        format.html {render 'new'}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    @user = User.find(params[:id]);

                    if @user.destroy
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted user', data:@user}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'User not deleted', data:@user.errors}, status: :forbidden}
                    end
                    format.html
                end
            end

            def update
                respond_to do |format|
                    @user = User.find(params[:id]);

                    if @user.update_attributes(user_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated user', data:@user}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'User not updated', data:@user.errors}, status: :unprocessable_entity}
                    end
                    format.html
                end
            end


            private

            def user_params
                params.require(:user).permit(:surname, :name, :sex)
            end
        end
    end
end