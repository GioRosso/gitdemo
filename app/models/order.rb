class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  before_save :set_quantity
  
  def set_quantity
      quantity = 1 if quantity == 0
  end
  
  
end