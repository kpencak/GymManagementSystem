module Api
    module V1
        class LockersController < ApplicationController
            def index
                respond_to do |format|
                    @lockers = Locker.order('is_free DESC');

                    format.json {render json: {status: 'SUCCESS', message: 'Loaded lockers', data:@lockers}, status: :ok}
                    format.html
                end
            end

            def show
                respond_to do |format|
                    @locker = Locker.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded locker', data:@locker}, status: :ok}
                    format.html
                end
            end

            def new
                @locker = Locker.new
            end

            def create
                respond_to do |format|
                    @locker = Locker.new(locker_params)

                    if @locker.save
                        format.json {render json: {status: 'SUCCESS', message: 'Saved new locker', data:@locker}, status: :ok}
                        format.html {redirect_to api_v1_lockers_path}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Locker not added', data:@locker.errors}, status: :unprocessable_entity}
                        format.html {render 'new'}
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
                    @locker = Locker.find(params[:id]);

                    if @locker.update(locker_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated locker properties', data:@locker}, status: :ok}
                        format.html {redirect_to api_v1_locker_path(@locker)}
                    else
                        format.json {render json: {status: 'ERROR', message: "Locker's properties not updated", data:@locker.errors}, status: :unprocessable_entity}
                        format.html {render 'edit'}
                    end
                end
            end

            def edit
                @locker = Locker.find(params[:id]);
            end


            private

            def locker_params
                params.require(:locker).permit(:is_free, :room, :card_id)
            end
        end
    end
end