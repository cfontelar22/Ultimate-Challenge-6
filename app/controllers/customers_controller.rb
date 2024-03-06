class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def missing_email
    @customers = Customer.where(email: [nil, ''])
  end

  def alphabetized
    @customers = Customer.order(:full_name)
  end
end
