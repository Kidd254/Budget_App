class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        @payments = Payment.all
    end
end
