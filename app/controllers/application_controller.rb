class ApplicationController < ActionController::Base
  layout :choose_layout

  private

  def choose_layout
    case controller_name.underscore
    when 'categories'
      if action_name == 'show'
        'category_details'
      elsif action_name == 'new'
        'add_categories'
      else
        'application'
      end
    when 'payments'
      if action_name == 'show'
        'category_details'
      elsif action_name == 'new'
        'add_transaction'
      else
        'application'
      end
    else
      'application'
    end
  end
end
