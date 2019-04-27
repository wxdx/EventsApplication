class EventsController < ApplicationController
	before_action :set_event, :only =>[:show, :edit, :update, :destroy]
	#GET /events/index
	#GET /events
	def index
		@events = Event.page(params[:page]).per(10)

		respond_to do |format|
			format.html
			format.json {
				render :json => @events.to_json
			}
		end

	end

	#GET /events/:id
	def show
		respond_to do |format|
			format.html
			format.json {
				render :json => {:id => @event.id, :name => @event.name, :description => @event.description}.to_json
			}
		end
	end

	#GET /events/new
	def new
		@event = Event.new
	end

	#POST /events
	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "新增成功"
			redirect_to events_path
		else
			render :action => :new
		end
	end

	#PATCH /events/:id/edit
	def edit
	end

	#PATCH /events/:id
	def update
		if @event.update(event_params)
			flash[:notice] = "更新成功"
			redirect_to event_path(@event)
		else 
			render :action => :edit
		end	
	end

	#DELETE /events/:id
	def destroy
		@event.destroy
		flash[:alert] = "删除成功"
		redirect_to events_path
	end

	private

	def set_event
  	@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description)
	end
end
