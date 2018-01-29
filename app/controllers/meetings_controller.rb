class MeetingsController < ApplicationController
    #GET /meetings
    def index
        @meetings = Meeting.all.order('id DESC')
    end

    #GET /meetings/new
    def new
        @meeting = Meeting.new
    end

    #POST /meetings
    def create
        @meeting = Meeting.new(meeting_params);
        if @meeting.save
            flash[:notice] = "La reunión ha sido creada con éxito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /meetings/:id/edit
    def edit
        @meeting = Meeting.find(params[:id])
    end

    # PUT /meetings
    def update
        meeting = Meeting.find(params[:meeting][:id])
        meeting.update_attributes(meeting_params)
        flash[:notice] = "La reunión ha sido editada con éxito."
        redirect_to :action => 'index'
    end

    # DELETE /meetings
    def destroy
        meeting = Meeting.find(params[:id])

        #if Activity.where(meeting_id: meeting).empty?
            meeting.destroy
            flash[:notice] = "La reunión ha sido eliminada con éxito."
            redirect_to :action => 'index'
        #else
        #    flash[:notice] = "La reunión a eliminar tiene elementos asociados."
        #    redirect_to :action => 'index'
        #end
    end

    private
    def meeting_params
      params.require(:meeting).permit(:descripcion, :activity_id)
    end
end
