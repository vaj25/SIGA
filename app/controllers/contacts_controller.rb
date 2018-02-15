class ContactsController < ApplicationController
    #GET /contacts
    def index
        @contacts = Contact.all.order('id DESC')
    end

    #GET /contacts/new
    def new
        #@activities= Activity.where(activities: { tipo: "Reunión" })
        @contact = Contact.new
    end

    #POST /contacts
    def create
        @contact = Contact.new(contact_params);
        if @contact.save
            flash[:notice] = "El contacto ha sido creado con éxito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /contacts/:id/edit
    def edit
        @contact = Contact.find(params[:id])
    end

    # PUT /contacts
    def update
        contact = Contact.find(params[:contact][:id])
        contact.update_attributes(contact_params)
        flash[:notice] = "El contacto ha sido editado con éxito."
        redirect_to :action => 'index'
    end

    # DELETE /contacts
    def destroy
        contact = Contact.find(params[:id])

        #if Activity.where(contact_id: contact).empty?
            contact.destroy
            flash[:notice] = "El contacto ha sido eliminado con éxito."
            redirect_to :action => 'index'
        #else
        #    flash[:notice] = "La reunión a eliminar tiene elementos asociados."
        #    redirect_to :action => 'index'
        #end
    end

    private
    def contact_params
      params.require(:contact).permit(:nombre, :email, :celular, :fijo, :organizacion)
    end
end
