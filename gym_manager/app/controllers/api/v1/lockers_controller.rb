module Api
    module V1
        class LockersController < ApplicationController
            def index
                respond_to do |format|
                    format.html
                    lockers = Locker.order('is_free DESC');

                    format.json {render json: {status: 'SUCCESS', message: 'Loaded lockers', data:lockers}, status: :ok}
                end
            end

            def show
                respond_to do |format|
                    format.html
                    locker = Locker.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded locker', data:locker}, status: :ok}
                end
            end

            def create
                respond_to do |format|
                    format.html
                    locker = Locker.new(locker_params)

                    if locker.save
                        format.json {render json: {status: 'SUCCESS', message: 'Saved new locker', data:locker}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Locker not added', data:locker.errors}, status: :unprocessable_entity}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    format.html
                    locker = Locker.find(params[:id]);

                    if locker.destroy && locker.is_free == "TRUE"
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted locker entry', data:locker}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Locker not deleted', data:locker.errors}, status: :forbidden}
                    end
                end
            end

            def update
                respond_to do |format|
                    format.html
                    locker = Locker.find(params[:id]);

                    if locker.update_attributes(locker_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated locker properties', data:locker}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: "Locker's properties not updated", data:locker.errors}, status: :unprocessable_entity}
                    end
                end
            end


            private

            def locker_params
                params.permit(:card_id, :is_free, :room)
            end
        end
    end
end