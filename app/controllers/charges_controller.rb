class ChargesController < ApplicationController
    #GET /charges
    def index
        @charges = Charge.all.order('id DESC')
    end

    #GET /charges/new
    def new
        @charge = Charge.new
    end

    #POST /charges
    def create
        @charge = Charge.new(charge_params);
        if @charge.save
            flash[:notice] = "Cargo creado con éxito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    # GET /charges/:id/edit
    def edit
        @charge = Charge.find(params[:id])
    end

    # PUT /charges
    def update
        charge = Charge.find(params[:charge][:id])
        charge.update_attributes(charge_params)
        flash[:notice] = "El cargo ha sido editado con éxito."
        redirect_to :action => 'index'
    end

    # DELETE /charges
    def destroy
        charge = Charge.find(params[:id])
        #if Charge.where(charge_id: charge).empty?
            charge.destroy
            flash[:notice] = "Cargo eliminado con éxito."
            redirect_to :action => 'index'
        #else
        #    flash[:notice] = "el miembro a eliminar tiene elementos asociados."
        #    redirect_to :action => 'index'
        #end
    end

    private
    def charge_params
      params.require(:charge).permit(:nombre, :descripcion)
    end
end
