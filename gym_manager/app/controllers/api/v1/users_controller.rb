module Api
    module V1
        class UsersController < ApplicationController
            def index
                respond_to do |format|
                    format.html
                    users = User.order('surname DESC');

                    format.json { render json: {status: 'SUCCESS', message: 'Loaded users', data:users}, status: :ok}
                end
            end

            def show
                respond_to do |format|
                    format.html
                    user = User.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded user', data:user}, status: :ok}
                end
            end

            def create
                respond_to do |format|
                    format.html
                    user = User.new(user_params)

                    if user.save
                        format.json {render json: {status: 'SUCCESS', message: 'Saved user', data:user}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'User not saved', data:user.errors}, status: :unprocessable_entity}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    format.html
                    user = User.find(params[:id]);

                    if user.destroy
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted user', data:user}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'User not deleted', data:user.errors}, status: :forbidden}
                    end
                end
            end

            def update
                respond_to do |format|
                    format.html
                    user = User.find(params[:id]);

                    if user.update_attributes(user_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated user', data:user}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'User not updated', data:user.errors}, status: :unprocessable_entity}
                    end
                end
            end


            private

            def user_params
                params.permit(:surname, :name, :sex)
            end
        end
    end
end