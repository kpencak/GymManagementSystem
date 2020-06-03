module Api
    module V1
        class EquipmentController < ApplicationController
            def index
                respond_to do |format|
                    @equipment = Equipment.order('is_free DESC');

                    format.json { render json: { status: 'SUCCESS', message: 'Loaded equipment', data:@equipment }, status: :ok}
                    format.html
                end
            end

            def show
                respond_to do |format|
                    @equipment = Equipment.find(params[:id]);
                
                    format.json {render json: { status: 'SUCCESS', message: 'Loaded equipment', data:@equipment }, status: :ok }
                    format.html
                end
            end

            def new
                @equipment = Equipment.new 
            end

            def create
                respond_to do |format|
                    @equipment = Equipment.new(equipment_params)

                    if @equipment.save
                        format.json {render json: {status: 'SUCCESS', message: 'Added new equipment', data:@equipment}, status: :ok}
                        format.html {redirect_to api_v1_equipment_index_path}
                    else
                        format.json {render json: {status: 'ERROR', message: 'New equipment not added', data:@equipment.errors}, status: :unprocessable_entity}
                        format.html {render 'new'}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    format.html
                    equipment = Equipment.find(params[:id]);

                    if equipment.destroy && equipment.is_free == "TRUE"
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted equipment', data:equipment}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Equipment not deleted', data:equipment.errors}, status: :forbidden}
                    end
                end
            end

            def update
                respond_to do |format|
                    @equipment = Equipment.find(params[:id]);

                    if @equipment.update(equipment_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated equipment properies', data:@equipment}, status: :ok}
                        format.html {redirect_to api_v1_equipment_path(@equipment)}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Equipment properties not updated', data:@equipment.errors}, status: :unprocessable_entity}
                        format.html {render 'edit'}
                    end
                end
            end

            def edit
                @equipment = Equipment.find(params[:id]);
            end


            private

            def equipment_params
                params.require(:equipment).permit(:card_id, :start_reservation_time, :end_reservation_time, :is_free)
            end
        end
    end
end