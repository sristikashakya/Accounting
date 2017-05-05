class StaticPagesController < ApplicationController
	def random
		@account=Account.order("RANDOM()").first
	end
	def about
	end
	def add
	end
end
