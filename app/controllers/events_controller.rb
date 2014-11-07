class EventsController < ApplicationController

  helper_method :sort_column, :sort_direction
	
  # GET /events
  # GET /events.json
  def index
    
	@events = Event.order(sort_column + " " + sort_direction)
	#@events = Event.where(deleted: false)
	
	if params[:name]
		@events = @events.where("name LIKE ?", "%#{params[:name]}%")
	end
	
	if params[:category_id]
		@events = @events.where("category_id = ?", params[:category_id])
	end
	
	if params[:venue]
		@events = @events.where("venue LIKE ?", "%#{params[:venue]}%")
	end
	
	if params[:from_date]
      day = params[:from_date]["written_on(3i)"];
      
	  if day.length != 0
        if day.length < 2
          day = "0" + day
        end

        month = params[:from_date]["written_on(2i)"];
        if month.length < 2
          month = "0" + month
        end
        date_string = params[:from_date]["written_on(1i)"] + "-" + month + "-" + day;
        
		@events = @events.where("from_date >= ?", date_string)
      end
    end
	
	if params[:to_date]
      day = params[:to_date]["written_on(3i)"];
      
	  if day.length != 0
        if day.length < 2
          day = "0" + day
        end

        month = params[:to_date]["written_on(2i)"];
        if month.length < 2
          month = "0" + month
        end
        date_string = params[:to_date]["written_on(1i)"] + "-" + month + "-" + day;
        
		@events = @events.where("to_date <= ?", date_string)
      end
    end
	
	# limit records to 10 per page
    @events = @events.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    #@event.update_attribute(:deleted, true)
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : "from_date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
