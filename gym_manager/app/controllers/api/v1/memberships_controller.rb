module Api
    module V1
        class MembershipsController < ApplicationController
            def index
                memberships = Membership.order('id DESC');
                render json: {status: 'SUCCESS', message: 'Loaded memberships', data:memberships}, status: :ok
            end

            def show
                membership = Membership.find(params[:id]);
                render json: {status: 'SUCCESS', message: 'Loaded membership', data:membership}, status: :ok
            end

            def create
                membership = Membership.new(membership_params)

                if membership.save
                    render json: {status: 'SUCCESS', message: 'Added new membership', data:membership}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Membership not saved', data:membership.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                membership = Membership.find(params[:id]);

                if membership.destroy
                    render json: {status: 'SUCCESS', message: 'Deleted membership', data:membership}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Membership not deleted', data:membership.errors}, status: :forbidden
                end
            end

            def update
                membership = Membership.find(params[:id]);

                if Membership.update_attributes(membership_params)
                    render json: {status: 'SUCCESS', message: 'Updated membership info', data:membership}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Membership not updated', data:membership.errors}, status: :unprocessable_entity
                end
            end


            private

            def membership_params
                params.permit(:user_id, :card_id, :status)
            end
        end
    end
end