class TransactionsController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in
  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, category_ids: [])
  end
end
