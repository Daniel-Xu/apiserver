module API
  class AccountsController < ApplicationController
    def index 
      accounts = Account.all
      respond_to do |f|
        f.json {render json: accounts, status: :ok }
      end
    end

    def show 
      account = Account.find(params[:id])
      respond_to do |f|
        f.json {render json: account, status: :ok } 
      end
    end

    def create 
      account = Account.new(account_params)
      if account.save
        respond_to do |f|
          f.json {render json: account, status: 201, locatoin: account}
          #f.json {head 204, locatoin: account}  without entity to make the server faster
        end
      else
        respond_to do |f|
          f.json {render json: account.errors, status: 422}
        end
      end
    end

    def update
      account = Account.find(params[:id])
      if account.update(account_params)
        respond_to do |f|
          f.json {render json: account, status: 200}
        end
      else
        respond_to do |f|
          f.json {render json: account.errors, status: 422}
        end
      end
    end

    def destroy 
      account = Account.find(params[:id])
      account.destroy
      head 204
    end


    private 
      def account_params
        params.require(:account).permit(:name)
      end
  end

end
