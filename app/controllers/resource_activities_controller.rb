class ResourceActivitiesController < ApplicationController
	#GET /resource activities
    def index
        @resource_activities = ResourceActivity.all.order('id DESC')
    end

    #GET /resource activities/new
    def new
        @resource_activity = ResourceActivity.new
    end

    #POST /resource activities
    def create
        @resource_activity = ResourceActivity.new(resource_activity_params);
        if @resource_activity.save
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /resource_activity/:id/edit
    def edit
        @resource_activity = ResourceActivity.find(params[:id])
    end

    # PUT /resource_activity
    def update
        resource_activity = ResourceActivity.find(params[:resource_activity][:id])
        resource_activity.update_attributes(resource_activity_params)
        redirect_to :action => 'index'
    end

    # DELETE /resource_activity
    def destroy
        resource_activity = ResourceActivity.find(params[:id])
        resource_activity.destroy
        redirect_to :action => 'index'
    end

    private
    def resource_activity_params
      params.require(:resource_activity).permit(:descripcion,  :precio, :cantidad, :activity_id)
    end
end
