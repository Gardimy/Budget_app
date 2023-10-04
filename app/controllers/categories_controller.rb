class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
	@categories = current_user.categories.includes(:transactions)
	@total_amounts = {}
	
	@categories.each do |category|
	  total_amount = category.transactions.sum(:amount)
	  @total_amounts[category.id] = total_amount
	end
  end

  def show
    @category = current_user.categories.find(params[:id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
