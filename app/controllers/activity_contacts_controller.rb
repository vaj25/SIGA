class ActivityContactsController < ApplicationController
    #GET /activity_contact_contacts
    def index
        @activity_contacts = ActivityContact.all.order('id DESC')
    end

    #GET /activity_contact_contacts/new
    def new
        @activity_id = params[:activity_id]
        @activity_contact = ActivityContact.new
    end

    #POST /activity_contact_contacts
    def create
        @activity_contact = ActivityContact.new(activity_contact_params);
        if @activity_contact.save
            flash[:notice] = "Contacto agregado a la actividad."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /activity_contact_contacts/:id/edit
    def edit
        @activity_contact = ActivityContact.find(params[:id])
    end

    # PUT /activity_contact_contacts
    def update
        activity_contact = ActivityContact.find(params[:activity_contact][:id])
        activity_contact.update_attributes(activity_contact_params)
        flash[:notice] = "Contacto de la actividad actualizado."
        redirect_to :action => 'index'
    end

    # DELETE /activity_contact_contacts
    def destroy
        activity_contact = ActivityContact.find(params[:id])

        #if Collection.where(activity_contact_id: activity_contact).empty?
            activity_contact.destroy
            flash[:notice] = "Contacto desvinculado de la actividad."
            redirect_to :action => 'index'
        #else
        #    flash[:notice] = "La actividad a eliminar tiene elementos asociados."
        #    redirect_to :action => 'index'
        #end
    end

    private
    def activity_contact_params
      params.require(:activity_contact).permit(:activity_id, :contact_id)
    end
end
