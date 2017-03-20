class Api::EventsController < ApplicationController
  def index
    render status: 200, json: {
      events: Event.all
    }.to_json
  end

  def show
    event = Event.find(params[:id])
    render status: 200, json: {
      event: event
    }.to_json
  end

  def create
    event = Event.find(event_params)

    if event.save
      render status:201, json: {
        event: event
      }.to_json

    else
      render status: 433, json: {
        errors: event.errors
      }.to_json
    end
  end

  private event_params
    def event_params
      params.require(:event).permit(:name, :description, :location, :price, :capacity, :includes_food, :includes_drinks, :starts_at, :ends_at, :active, category_ids: [])
    end

end
