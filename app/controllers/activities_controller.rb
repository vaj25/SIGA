class ActivitiesController < ApplicationController
    #GET /activities
    def index
        @activities = Activity.all.order('id DESC')
    end

    #GET /activities/new
    def new
        @activity = Activity.new
    end

    #POST /activities
    def create
        @activity = Activity.new(activity_params);
        if @activity.save
            flash[:notice] = "La actividad ha sido creada con exito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /activities/:id/edit
    def edit
        @activity = Activity.find(params[:id])
    end

    # PUT /activities
    def update
        activity = Activity.find(params[:activity][:id])
        activity.update_attributes(activity_params)
        flash[:notice] = "La actividad ha sido editada con exito."
        redirect_to :action => 'index'
    end

    # DELETE /activities
    def destroy
        activity = Activity.find(params[:id])

        if Collection.where(activity_id: activity).empty?
            activity.destroy
            flash[:notice] = "La actividad ha sido eliminada con exito."
            redirect_to :action => 'index'
        else
            flash[:notice] = "La actividad a eliminar tiene elementos asociados."
            redirect_to :action => 'index'
        end
    end

    private
    def activity_params
      params.require(:activity).permit(:tipo, :descripcion, :fecha_inicio, :fecha_fin, :zone_id)
    end
end
