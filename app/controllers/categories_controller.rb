class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    @payments = Payment.all
  end

  def show
    @category = Category.find(params[:id])
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end
end
