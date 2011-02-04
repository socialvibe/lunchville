class LunchesController < ApplicationController
  # GET /lunches
  # GET /lunches.xml
  def index
    @lunches = Lunch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lunches }
    end
  end

  # GET /lunches/1
  # GET /lunches/1.xml
  def show
    @lunch = Lunch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lunch }
    end
  end

  # GET /lunches/new
  # GET /lunches/new.xml
  def new
    @lunch = Lunch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lunch }
    end
  end

  # GET /lunches/1/edit
  def edit
    @lunch = Lunch.find(params[:id])
  end

  # POST /vote
  # POST /vote.xml
  def vote
    @lunch = Lunch.find(params[:id])
    if params[:up_or_down]
      current_user.vote_for(@lunch) 
    else
      current_user.vote_against(@lunch) 
    end

    respond_to do |format|
      flash[:notice] = 'Thank you for voting.'
      format.html { redirect_to(@lunch) }
    end
  end

  # POST /lunches
  # POST /lunches.xml
  def create
    @lunch = Lunch.new(params[:lunch])

    respond_to do |format|
      if @lunch.save
        flash[:notice] = 'Lunch was successfully created.'
        format.html { redirect_to(@lunch) }
        format.xml  { render :xml => @lunch, :status => :created, :location => @lunch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lunch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lunches/1
  # PUT /lunches/1.xml
  def update
    @lunch = Lunch.find(params[:id])

    respond_to do |format|
      if @lunch.update_attributes(params[:lunch])
        flash[:notice] = 'Lunch was successfully updated.'
        format.html { redirect_to(@lunch) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lunch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lunches/1
  # DELETE /lunches/1.xml
  def destroy
    @lunch = Lunch.find(params[:id])
    @lunch.destroy

    respond_to do |format|
      format.html { redirect_to(lunches_url) }
      format.xml  { head :ok }
    end
  end
end
