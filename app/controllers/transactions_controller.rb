class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: [:index, :new, :create]

  def index
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @transaction = @category.transactions.build
    @categories = current_user.categories
  end

  def create
    @transaction = @category.transactions.build(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction was successfully created.'
    else
      @categories = current_user.categories
      render :new
    end
  end

  private

  def find_category
    @category = current_user.categories.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, category_ids: [])
  end
end
