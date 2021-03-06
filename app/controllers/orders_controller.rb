class OrdersController < ApplicationController
  layout 'application'
  
  
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.for_today.includes(:user)
    @users_missing_orders = Lunch.for_today.users_missing_orders

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @lunch = Lunch.for_today
    @order = @lunch.orders.new
    @restaurant = @lunch.restaurant

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @lunch = Lunch.for_today
    @order = @lunch.orders.new(params[:order].merge(:user => current_user))
    @restaurant = @lunch.restaurant
    
    respond_to do |format|
      if @order.save
        flash[:notice] = 'Your order has been placed.  Let the anticipation begin!'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        flash.now[:notice] = 'Looks like you already submitted your order.<br/>Want to change your order?  Email no-one-cares@svnetwork.com ;-)'
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
