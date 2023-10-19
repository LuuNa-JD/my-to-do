class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def new
    @grocery = Grocery.new
  end
  def show
    @grocery = Grocery.find(params[:id])
  end

  def edit
    @grocery = Grocery.find(params[:id])
  end

  def create
    @grocery = Grocery.new(grocery_params)
    @grocery.save
    redirect_to groceries_path(@grocery)
  end

  def update
    @grocery = Grocery.find(params[:id])
    @grocery.update(grocery_params)
    redirect_to groceries_path, status: :see_other
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    @grocery.destroy
    redirect_to groceries_path, status: :see_other
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :quantity, :category, :completed)
  end
end
