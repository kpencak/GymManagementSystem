module Api
    module V1
        class EquipmentController < ApplicationController
            def index
                equipment = Equipment.order('is_free DESC');
                render json: {status: 'SUCCESS', message: 'Loaded equipment', data:equipment}, status: :ok
            end

            def show
                equipment = Equipment.find(params[:id]);
                render json: {status: 'SUCCESS', message: 'Loaded equipment', data:equipment}, status: :ok
            end

            def create
                equipment = Equipment.new(equipment_params)

                if equipment.save
                    render json: {status: 'SUCCESS', message: 'Added new equipment', data:equipment}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'New equipment not added', data:equipment.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                equipment = Equipment.find(params[:id]);

                if equipment.destroy && equipment.is_free == "TRUE"
                    render json: {status: 'SUCCESS', message: 'Deleted equipment', data:equipment}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Equipment not deleted', data:equipment.errors}, status: :forbidden
                end
            end

            def update
                equipment = Equipment.find(params[:id]);

                if equipment.update_attributes(equipment_params)
                    render json: {status: 'SUCCESS', message: 'Updated equipment properies', data:equipment}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Equipment properties not updated', data:equipment.errors}, status: :unprocessable_entity
                end
            end


            private

            def equipment_params
                params.permit(:card_id, :start_reservation_time, :end_reservation_time, :is_free)
            end
        end
    end
end