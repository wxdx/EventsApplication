class EventsController < ApplicationController
	before_action :set_event, :only =>[:show, :edit, :update, :destroy]
	#GET /events/index
	def index
		@events = Event.all
	end

	#GET /events/new
	def new
		@event = Event.new
	end

	#POST /events/create
	def create
		@event = Event.new(event_params)
		@event.save

		redirect_to :action => :index
	end

	#GET /events/show/:id
	def show
	end

	#GET /events/edit/:id
	def edit
	end

	#POST /events/update/:id
	def update
		@event.update(event_params)
		redirect_to :action => :show, :id => @event
	end

	#POST /events/destory/:id
	def destory
		@event.destroy
		redirect_to :action => :index
	end

	private
	
	def set_event
  	@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description)
	end
end
