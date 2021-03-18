class RequestsController < ApplicationController
    before_action :find_request, only:[:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_user!,only:[:edit,:update,:destroy]


    def new
        @request = Request.new
    end

    def create
        @request=Request.new request_params
        @request.user = current_user

        if @request.save
            redirect_to requests_path # index page   
        else
            render :new
        end
    end

    def index
        @requests = Request.search(params[:search])
    end

    def show

    end

    def edit

    end

    def destroy   
        @requests.destroy
        redirect_to requests_path
    end

    def update
        if @request.update request_params
            redirect_to requests_path 
        else
            render :edit
        end
    end


    private

    def find_request
        @request=Request.find params[:id]
    end

    def request_params
        params.require(:request).permit(
            :suit_no,
            :name,
            :request_type,
            :request_status,
            :contact_phone,
            :email,
            :additional_notes)
    end
    def authorize_user!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @request)
    end
end
