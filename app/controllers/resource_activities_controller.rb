class ResourceActivitiesController < ApplicationController
	#GET /resource activities
    def index
        @resource_activities= ResourceActivity.where(resource_activities: { activity_id: params[:activity_id] })
    end

    #GET /resource activities/new
    def new
        @activity_id = params[:activity_id]
        @resource_activity = ResourceActivity.new
    end

    #POST /resource activities
    def create
        @resource_activity = ResourceActivity.new(resource_activity_params);
        if @resource_activity.save
            redirect_to :action => 'index', :activity_id=>params[:resource_activity][:activity_id]
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
        redirect_to :action => 'index', :activity_id=>params[:resource_activity][:activity_id]
    end

    # DELETE /resource_activity
    def destroy
        resource_activity = ResourceActivity.find(params[:id])
        resource_activity.destroy
        redirect_to :action => 'index', :activity_id=>params[:activity_id]
    end

    private
    def resource_activity_params
      params.require(:resource_activity).permit(:descripcion,  :precio, :cantidad, :activity_id)
    end
end
