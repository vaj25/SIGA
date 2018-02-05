class ResourceActivitiesTreesController < ApplicationController

	#GET /resource activities tree
    def index
        @resource_activities_trees = ResourceActivitiesTree.where(resource_activities_trees: {resource_activity_id: params[:resource_activity_id]})
    end

    #GET /resource activities tree/new
    def new
        @resource_activity_id = params[:resource_activity_id]
        @activity_id = params[:activity_id]
        @resource_activities_tree = ResourceActivitiesTree.new
    end

    #POST /resource activities
    def create
        @resource_activities_tree = ResourceActivitiesTree.new(resource_activities_tree_params);
        if @resource_activities_tree.save
            redirect_to :action => 'index', :resource_activity_id=>params[:resource_activities_tree][:resource_activity_id],
            :activity_id=>params[:resource_activities_tree][:activity_id]
        else
            render :new
        end
    end

    #GET /resource_activity/:id/edit
    def edit
        @activity_id = params[:activity_id]
        @resource_activities_tree = ResourceActivitiesTree.find(params[:id])
    end

    # PUT /resource_activity
    def update
        resource_activities_tree = ResourceActivitiesTree.find(params[:resource_activities_tree][:id])
        resource_activities_tree.update_attributes(resource_activities_tree_params)
        redirect_to :action => 'index', :resource_activity_id=>params[:resource_activities_tree][:resource_activity_id],
        :activity_id=>params[:resource_activities_tree][:activity_id]
    end

    # DELETE /resource_activity
    def destroy
        resource_activities_tree = ResourceActivitiesTree.find(params[:id])
        resource_activities_tree.destroy
        redirect_to :action => 'index', :resource_activity_id=>params[:resource_activity_id], :activity_id=>params[:activity_id]
    end

    private
    def resource_activities_tree_params
      params.require(:resource_activities_tree).permit(:cantidad, :tree_id, :resource_activity_id)
    end
end
