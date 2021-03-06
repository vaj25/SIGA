class CollectionsController < ApplicationController
    #GET /collections
    def index
        @collections = Collection.all.order('id DESC')
    end

    #GET /collections/new
    def new
        @activities= Activity.where(activities: { tipo: "Recaudación de fondos" })
        @collection = Collection.new
    end

    #POST /collections
    def create
        @collection = Collection.new(collection_params);
        if @collection.save
            flash[:notice] = "La recaudación ha sido creada con exito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /collections/:id/edit
    def edit
        @collection = Collection.find(params[:id])
    end

    #PUT /collections
    def update
        collection = Collection.find(params[:collection][:id])
        collection.update_attributes(collection_params)
        flash[:notice] = "La recaudación ha sido editada con exito."
        redirect_to :action => 'index'
    end

    #DELETE /collections
    def destroy
        collection = Collection.find(params[:id])
        collection.destroy
        flash[:notice] = "La recaudación ha sido eliminada con exito."
        redirect_to :action => 'index'
    end

    private
    def collection_params
      params.require(:collection).permit(:concepto, :descripcion, :activity_id)
    end

end
