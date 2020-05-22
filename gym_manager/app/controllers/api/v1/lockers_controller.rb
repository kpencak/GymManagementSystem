module Api
    module V1
        class LockersController < ApplicationController
            def index
                lockers = Locker.order('is_free DESC');
                render json: {status: 'SUCCESS', message: 'Loaded lockers', data:lockers}, status: :ok
            end

            def show
                locker = Locker.find(params[:id]);
                render json: {status: 'SUCCESS', message: 'Loaded locker', data:locker}, status: :ok
            end

            def create
                locker = Locker.new(locker_params)

                if locker.save
                    render json: {status: 'SUCCESS', message: 'Saved new locker', data:locker}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Locker not added', data:locker.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                locker = Locker.find(params[:id]);

                if locker.destroy && locker.is_free == "TRUE"
                    render json: {status: 'SUCCESS', message: 'Deleted locker entry', data:locker}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Locker not deleted', data:locker.errors}, status: :forbidden
                end
            end

            def update
                locker = Locker.find(params[:id]);

                if locker.update_attributes(locker_params)
                    render json: {status: 'SUCCESS', message: 'Updated locker properties', data:locker}, status: :ok
                else
                    render json: {status: 'ERROR', message: "Locker's properties not updated", data:locker.errors}, status: :unprocessable_entity
                end
            end


            private

            def locker_params
                params.permit(:card_id, :is_free, :room)
            end
        end
    end
end