class TreesController < ApplicationController
	#GET /trees
    def index
        @trees = Tree.all.order('id DESC')
    end

    #GET /trees/new
    def new
        @tree = Tree.new
    end

    #POST /trees
    def create
        @tree = Tree.new(tree_params);
        if @tree.save
            flash[:notice] = "El árbol ha sido creado con exito."
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    # GET /trees/:id/edit
    def edit
        @tree = Tree.find(params[:id])
    end

    # PUT /trees
    def update
        tree = Tree.find(params[:tree][:id])
        tree.update_attributes(tree_params)
        flash[:notice] = "El árbol ha sido editado con exito."
        redirect_to :action => 'index'
    end

    # DELETE /trees
    def destroy
        tree = Tree.find(params[:id])

        if DetailIncome.where(tree_id: tree).empty?
            tree.destroy
            flash[:notice] = "El árbol ha sido eliminado con exito."
            redirect_to :action => 'index'
        else
            flash[:notice] = "El árbol a eliminar tiene detalles asociados."
            redirect_to :action => 'index'
        end
    end

    private
    def tree_params
      params.require(:tree).permit(:nombre_comun, :nombre_cientifico, :observaciones)
    end
end
