class AccountsController < ApplicationController
	def index
		@accounts= Account.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		@balance=Account.balance
		@debt=Account.debt
		@total=Account.total
	end
	def create
		@accounts= Account.create(account_params)
		if @accounts.valid?
			flash[:success] = "Your idea has been posted!"
		else
			flash[:alert] = "Woops! Looks like there has been an error!"
		end
		redirect_to root_path

	end
	def edit
		 @accounts = Account.find(params[:id])
	end
	def update
		@accounts = Account.find(params[:id])
			if @accounts.update(account_params)
				flash[:success] = "The idea has been updated!"
				redirect_to root_path
			else
				flash[:alert] = "Woops! Looks like there has been an error!"
				redirect_to edit_account_path(params[:id])
		end
	end
	def destroy
		@accounts=Account.find(params[:id])
		@accounts.destroy
		flash[:success] = "The idea was successfully deleted!"
		redirect_to root_path
	end
	private

		def account_params
			params.require(:account).permit(:date, :title , :amount)
		end
end
