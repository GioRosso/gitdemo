class ProductsController < ApplicationController
    
    before_action :authorize
    
    def index
    @products_count = Product.count
    
    if params[:sort]
        @products = Product.order(price: :desc)
    else
        @products = Product.all
    end
    
    respond_to do |format|
        format.html
        format.js 
        format.json { render json: @products }
        format.xml { render xml: @products }
    end
    
    end
    
    def show
        product_id = params[:id]
        @product = Product.find(product_id)
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        
        if @product.save
        redirect_to(products_path())
        else
            flash[:error] = 'Product create failed!'
            render :new
        end
        
    end
    
    def edit
        @product = Product.find(params[:id])
    end
    
    def update
    
        @product = Product.find(params[:id])
        if @product.update_attributes(product_params)
            redirect_to(product_path(@product))
        else
           flash[:error] = 'Neuspješno ažuriranje proizvoda'
           render :edit
        end
    end
    
    def destroy
        @product = Product.find(params[:id])
        product_name = @product.name
        @product.destroy
        flash[:notice] = "Uspješno ste obrisali: #{product_name}!"
        redirect_to products_path
    end
    
    def stats
    @total_products = Product.count
    end
    
    def stat
    product = Product.find(params[:id])
    @product_buyers = product.buyers.count
    end
    
    private
    
    def product_params
        params.require(:product).permit(:name, :price, :description)    
    end

    
end
