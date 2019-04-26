class EventsController < ApplicationController
	before_action :set_event, :only =>[:show, :edit, :update, :destroy]
	#GET /events/index
	def index
		@events = Event.page(params[:page]).per(10)
	end

	#GET /events/new
	def new
		@event = Event.new
	end

	#POST /events/create
	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "新增成功"
			redirect_to :action => :index
		else
			render :action => :new
		end
	end

	#GET /events/show/:id
	def show
	end

	#GET /events/edit/:id
	def edit
	end

	#POST /events/update/:id
	def update
		if @event.update(event_params)
			flash[:notice] = "更新成功"
			redirect_to :action => :show, :id => @event
		else 
			render :action => :edit
		end	
	end

	#POST /events/destory/:id
	def destroy
		@event.destroy
		flash[:alert] = "删除成功"
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
