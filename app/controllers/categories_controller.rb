class CategoriesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @categories = Category.all
        @payments = Payment.all
    end
end
