class CollectionsController < ApplicationController
    #GET /collections
    def index
        @collections = Collection.all.order('id DESC')
    end

    #GET /collections/new
    def new
        @collection = Collection.new
    end

    #POST /collections
    def create
        @collection = Collection.new(collection_params);
        if @collection.save
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
        redirect_to :action => 'index'
    end

    #DELETE /collections
    def destroy
        collection = Collection.find(params[:id])
        collection.destroy
        redirect_to :action => 'index'
    end

    private
    def collection_params
      params.require(:collection).permit(:concepto, :descripcion, :activity_id)
    end

end