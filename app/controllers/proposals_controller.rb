class ProposalsController < ApplicationController
  layout 'application'

  # GET /proposals
  # GET /proposals.xml
  def index
    @proposals = Lunch.next.proposals

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proposals }
    end
  end

  # GET /proposals/1
  # GET /proposals/1.xml
  def show
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.xml
  def new
    @restaurants = Restaurant.all
    @proposal = Lunch.next.proposals.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.xml
  def create
    @restaurants = Restaurant.all
    @proposal = Lunch.next.proposals.new(params[:proposal].merge(:user => current_user))

    respond_to do |format|
      if @proposal.save
        flash[:notice] = 'Thanks for submitting your proposal!'
        format.html { redirect_to(@proposal) }
        format.xml  { render :xml => @proposal, :status => :created, :location => @proposal }
        format.js { render 'shared/success' }
      else
        flash.now[:notice] = 'Looks like you already submitted a proposal!  Only one per person.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @proposal.errors, :status => :unprocessable_entity }
        format.js { render 'shared/error' }
      end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.xml
  def update
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        flash[:notice] = 'Proposal was successfully updated.'
        format.html { redirect_to(@proposal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.xml
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to(proposals_url) }
      format.xml  { head :ok }
    end
  end
  
  def vote
    @proposal = Proposal.find(params[:id])
    
    begin
      current_user.decrement_lunch_bucks!(params[:amount].try(:to_i) || 1)
      current_user.vote_for(@proposal)
      
      respond_to do |format|
        flash[:notice] = 'Thank you for voting.'
        format.html { redirect_to(@proposal) }
        format.js { render 'shared/success' }
      end
    rescue
      
      respond_to do |format|
        flash[:notice] = 'Sorry, you do not have enough lunch bucks to do that!'
        format.html { redirect_to(@proposal) }
        format.js { render 'shared/error' }
      end
    end
    
  end
end
