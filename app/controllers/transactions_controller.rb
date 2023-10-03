class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = current_user.categories.find(params[:category_id])
    @transaction = @category.transactions.build
  end

  def create
	@category = current_user.categories.find(params[:category_id])
	@transaction = @category.transactions.build(transaction_params)
  
	if @transaction.save
	  redirect_to category_path(@category), notice: 'Transaction was successfully created.'
	else
	  render :new
	end
  end  

  private

  def transaction_params
	params.require(:transaction).permit(:name, :amount, :category_id)
  end  
end
