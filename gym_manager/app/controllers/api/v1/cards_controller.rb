module Api
    module V1
        class CardsController < ApplicationController
            def index
                respond_to do |format|
                    format.html
                    cards = Card.order('id DESC');
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded cards', data:cards}, status: :ok}
                end
            end

            def show
                respond_to do |format|
                    format.html
                    card = Card.find(params[:id]);
                
                    format.json {render json: {status: 'SUCCESS', message: 'Loaded card', data:card}, status: :ok}
                end
            end

            def create
                respond_to do |format|
                    format.html
                    card = Card.new(card_params)

                    if card.save
                        format.json {render json: {status: 'SUCCESS', message: 'Saved card', data:card}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Card not saved', data:card.errors}, status: :unprocessable_entity}
                    end
                end
            end

            def destroy
                respond_to do |format|
                    format.html
                    card = Card.find(params[:id]);

                    if card.destroy && card.locker_id == null
                        format.json {render json: {status: 'SUCCESS', message: 'Deleted card', data:card}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Card not deleted', data:card.errors}, status: :forbidden}
                    end
                end
            end

            def update
                respond_to do |format|
                    format.html
                    card = Card.find(params[:id]);

                    if card.update_attributes(card_params)
                        format.json {render json: {status: 'SUCCESS', message: 'Updated card', data:card}, status: :ok}
                    else
                        format.json {render json: {status: 'ERROR', message: 'Card not updated', data:card.errors}, status: :unprocessable_entity}
                    end
                end
            end


            private

            def card_params
                params.permit(:status, :membership_id, :locker_id)
            end
        end
    end
end