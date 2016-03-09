class Product < ActiveRecord::Base
    
    #belongs_to :bategory
    
    has_many :orders
    has_many :users, through: :orders
    # has_many :korisnika, through: :orders, source: :user
    
    validates :name, presence: true
    validates :price, presence: true, numericality: true
    
end
