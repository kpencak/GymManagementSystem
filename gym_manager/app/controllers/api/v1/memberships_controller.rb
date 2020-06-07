module Api
    module V1
        class MembershipsController < ApplicationController
            def index
                respond_to do |format|
                    @memberships = Membership.order('id DESC');

                    format.json {render json: {status: 'SUCCESS', message: 'Loaded memberships', data:@memberships}, status: :ok}
                    format.html
                end
            end

            def show
                respond_to do |format|
                    @membership = Membership.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded membership', data:@membership}, status: :ok}
                    format.html
                end
            end

            def new
                @membership = Membership.new
            end

            def create
                respond_to do |format|
                    @membership = Membership.new(membership_params)

                    if @membership.save
                        format.json {render json: {status: 'SUCCESS', message: 'Added new membership', data:@membership}, status: :ok}
                        format.html {redirect_to api_v1_memberships_path}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Membership not saved', data:@membership.errors}, status: :unprocessable_entity}
                        format.html {render 'new'}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    @membership = Membership.find(params[:id]);

                    if @membership.destroy
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted membership', data:@membership}, status: :ok}
                        format.html {redirect_to api_v1_memberships_path}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Membership not deleted', data:@membership.errors}, status: :forbidden}
                        format.html {redirect_to api_v1_membership_path(@membership)}
                    end
                end
            end

            def update
                respond_to do |format|
                    @membership = Membership.find(params[:id]);

                    if Membership.update(membership_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated membership info', data:@membership}, status: :ok}
                        format.html {redirect_to api_v1_membership_path(@membership)}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Membership not updated', data:@membership.errors}, status: :unprocessable_entity}
                        format.html {render 'edit'}
                    end
                end
            end

            def edit
                @membership = Membership.find(params[:id]);
            end


            private

            def membership_params
                params.require(:membership).permit(:user_id, :card_id, :status)
            end
        end
    end
end