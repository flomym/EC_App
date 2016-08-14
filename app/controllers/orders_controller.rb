class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
	end

  def update
    @order = Order.find(params[:id])

    if params.dig(:order, :status) == 'checked_out'
      @order.checkout!(Time.now)
      session.delete(:current_order_id)

      redirect_to @order
    else
      head(:bad_request)
    end
  end
end