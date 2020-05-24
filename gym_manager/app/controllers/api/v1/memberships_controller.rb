module Api
    module V1
        class MembershipsController < ApplicationController
            def index
                respond_to do |format|
                    format.html
                    memberships = Membership.order('id DESC');

                    format.json {render json: {status: 'SUCCESS', message: 'Loaded memberships', data:memberships}, status: :ok}
                end
            end

            def show
                respond_to do |format|
                    format.html
                    membership = Membership.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded membership', data:membership}, status: :ok}
                end
            end

            def create
                respond_to do |format|
                    format.html
                    membership = Membership.new(membership_params)

                    if membership.save
                        format.json {render json: {status: 'SUCCESS', message: 'Added new membership', data:membership}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Membership not saved', data:membership.errors}, status: :unprocessable_entity}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    format.html
                    membership = Membership.find(params[:id]);

                    if membership.destroy
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted membership', data:membership}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Membership not deleted', data:membership.errors}, status: :forbidden}
                    end
                end
            end

            def update
                respond_to do |format|
                    format.html
                    membership = Membership.find(params[:id]);

                    if Membership.update_attributes(membership_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated membership info', data:membership}, status: :ok}
                    else
                        foramt.json {render json: {status: 'ERROR', message: 'Membership not updated', data:membership.errors}, status: :unprocessable_entity}
                    end
                end
            end


            private

            def membership_params
                params.permit(:user_id, :card_id, :status)
            end
        end
    end
end