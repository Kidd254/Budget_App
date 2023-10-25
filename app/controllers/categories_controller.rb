class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = current_user.categories
    @payments = Payment.all
  end

  def show
    @category = Category.find(params[:id])
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
