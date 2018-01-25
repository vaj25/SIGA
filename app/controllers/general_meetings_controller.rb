class GeneralMeetingsController < ApplicationController
    #GET /general_meetings
    def index
        @general_meetings = GeneralMeeting.all.order('id DESC')
    end

    #GET /general_meetings/new
    def new
        @general_meeting = GeneralMeeting.new
    end

    #POST /general_meetings
    def create
        @general_meeting = GeneralMeeting.new(general_meeting_params);
        if @general_meeting.save
            flash[:notice] = "La junta general ha sido creada con éxito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /general_meetings/:id/edit
    def edit
        @general_meeting = GeneralMeeting.find(params[:id])
    end

    # PUT /general_meetings
    def update
        general_meeting = GeneralMeeting.find(params[:general_meeting][:id])
        general_meeting.update_attributes(general_meeting_params)
        flash[:notice] = "La junta general ha sido editada con éxito."
        redirect_to :action => 'index'
    end

    # DELETE /general_meetings
    def destroy
        general_meeting = GeneralMeeting.find(params[:id])

        if Collection.where(activity_id: general_meeting).empty?
            general_meeting.destroy
            flash[:notice] = "La junta general ha sido eliminada con exito."
            redirect_to :action => 'index'
        else
            flash[:notice] = "La junta general a eliminar tiene elementos asociados."
            redirect_to :action => 'index'
        end
    end

    private
    def general_meeting_params
      params.require(:general_meeting).permit(:num_asistentes, :activity_id)
    end
end
