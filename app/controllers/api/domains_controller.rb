module API
  class DomainsController < ApplicationController
    def index 
      domains = Domain.all
      respond_to do |f|
        f.json { render json: domains, status: :ok }
      end
    end

    def show 
      domain = Domain.find(params[:id])

      respond_to do |f|
        f.json { render json: domain, status: :ok }
      end
    end

    def create 
      domain = Domain.new(domain_params)
      if domain.save
        respond_to do |f|
          f.json {render json: domain, status: 201, locatoin: domain}
          #f.json {head 204, locatoin: domain}  without entity to make the server faster
        end
      else
        respond_to do |f|
          f.json {render json: domain.errors, status: 422}
        end
      end
    end

    def update
      domain = Domain.find(params[:id])
      if domain.update(domain_params)
        respond_to do |f|
          f.json {render json: domain, status: 200}
        end
      else
        respond_to do |f|
          f.json {render json: domain.errors, status: 422}
        end
      end
    end

    def delete 
      domain = Domain.find(params[:id])
      domain.destroy
      head 204
    end

    private 
      def domain_params
        params.require(:domain).permit(:hostname, :ip, :account_id)
      end

  end
end
