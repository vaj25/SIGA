class MeetingMembersController < ApplicationController
    #GET /meeting_members
    def index
        @meeting_members= MeetingMember.where(meeting_members: { meeting_id: params[:meeting_id] })
    end

    #GET /meeting_members/new
    def new
        @members = Member.where(members: { activo: true }).select("members.primer_nombre, members.segundo_nombre, members.primer_apellido,
        members.segundo_apellido, members.id")

        @meeting_id = params[:meeting_id]
        @meeting_member = MeetingMember.new
    end

    #POST /meeting_members
    def create
        @meeting_member = MeetingMember.new(meeting_member_params);
        if @meeting_member.save
            flash[:notice] = "Miembro agregado a la reunión con éxito."
            redirect_to :action => 'index', :meeting_id=>params[:meeting_member][:meeting_id]
        else
            render :new
        end
    end

    # GET /meeting_members/:id/edit
    def edit
        @meeting_member = MeetingMember.find(params[:id])
    end

    # PUT /meeting_members
    def update
        meeting_member = MeetingMember.find(params[:meeting_member][:id])
        meeting_member.update_attributes(meeting_member_params)
        flash[:notice] = "Miembro ha sido editado con éxito."
        redirect_to :action => 'index', :meeting_id=>params[:meeting_member][:meeting_id]
    end

    # DELETE /meeting_members
    def destroy
        meeting_member = MeetingMember.find(params[:id])
        #if MeetingMember.where(charge_id: member).empty?
            meeting_member.destroy
            flash[:notice] = "Miembro eliminado con éxito."
            redirect_to :action => 'index', :meeting_id=>params[:meeting_id]
        #else
        #    flash[:notice] = "el miembro a eliminar tiene elementos asociados."
        #    redirect_to :action => 'index'
        #end
    end

    private
    def meeting_member_params
      params.require(:meeting_member).permit(:meeting_id, :member_id)
    end
end
