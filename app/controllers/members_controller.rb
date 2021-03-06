class MembersController < ApplicationController
    #GET /members
    def index
        @members= Member.where(members: { general_meeting_id: params[:general_meeting_id] })
    end

    #GET /members/new
    def new
        @general_meeting_id = params[:general_meeting_id]
        @member = Member.new
    end

    #POST /members
    def create
        @member = Member.new(member_params);
        if @member.save
            flash[:notice] = "Miembro creado con éxito."
            redirect_to :action => 'index', :general_meeting_id=>params[:member][:general_meeting_id]
        else
            render :new
        end
    end

    # GET /members/:id/edit
    def edit
        @member = Member.find(params[:id])
    end

    # PUT /members
    def update
        member = Member.find(params[:member][:id])
        member.update_attributes(member_params)
        flash[:notice] = "Miembro ha sido editado con éxito."
        redirect_to :action => 'index', :general_meeting_id=>params[:member][:general_meeting_id]
    end

    # DELETE /members
    def destroy
        member = Member.find(params[:id])
        if MeetingMember.where(member_id: member).empty?
            member.destroy
            flash[:notice] = "Miembro eliminado con éxito."
            redirect_to :action => 'index', :general_meeting_id=>params[:general_meeting_id]
        else
            flash[:notice] = "el miembro a eliminar tiene elementos asociados."
            redirect_to :action => 'index', :general_meeting_id=>params[:general_meeting_id]
        end
    end

    private
    def member_params
      params.require(:member).permit(:primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :dui,
      :charge_id, :general_meeting_id, :activo)
    end
end
