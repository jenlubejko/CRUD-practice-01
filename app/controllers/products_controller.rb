class ProductsController < ApplicationController
  def index
    @products = Product.all 
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    product = Product.new(
      name: params["name"],
      description: params["description"],
      price: params["price"]
    )
    product.save
    flash[:success] = "Product has been created successfully!"
    redirect_to '/products'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.name = params[:name]
    product.description = params[:description]
    product.price = params[:price]
    redirect_to "/products/#{product.id}"
  end

  def destroy
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.destroy
    flash[:success] = "Contact destroyed!"
    redirect_to '/contacts'
  end
end