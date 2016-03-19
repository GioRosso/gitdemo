class Product < ActiveRecord::Base
    
    #belongs_to :category
    
    has_many :orders
    has_many :buyers, through: :orders, source: :user
    #has_many :users, through: :orders
    
    # has_many :korisnika, through: :orders, source: :user
    has_many :reviews
    
    validates :price, numericality: true
    validates_presence_of :name, :price
    
end
