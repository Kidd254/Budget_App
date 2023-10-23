class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.author_id = current_user.id
    if @payment.save
      redirect_to category_path(@payment.category)
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
