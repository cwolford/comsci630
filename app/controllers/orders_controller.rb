class OrdersController < ApplicationController
	
  	def new
    	@order = Order.new
    	@user = User.find(params[:user_id])
  	end

  	def show
    	@order = Order.find(params[:id, :user_id])
  	end

	def create
	    @order = Order.new(order_params)
	    @order.user = User.find(params[:user_id])
	    if @order.save
	    	User.techyes.each do |user|
				UserMailer.work_order(@order, user).deliver
			end
				flash[:success] = "Work Order Form Completed!"
				redirect_to root_path
	    else
	      render 'new'
	    end
	end

  	def edit
    	@order = Order.find(params[:id])
  	end

	def update
	end

	def index
		@orders = Order.all
	end

	private

    def order_params
      params.require(:order).permit(:issue, :description, :time, :status, :user) if params[:order]
      params.require(:user).permid(:user_id) if params[:user]
    end

end