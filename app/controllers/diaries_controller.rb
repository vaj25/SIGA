class DiariesController < ApplicationController
    #GET /diaries
    def index
        @diaries = Diary.all.order('id DESC')
    end

    #GET /diaries/new
    def new
        @meeting_id = params[:meeting_id]
        @diary = Diary.new
    end

    #POST /diaries
    def create
        @diary = Diary.new(diary_params);
        if @diary.save
            flash[:notice] = "Punto creado con éxito."
            redirect_to :action => 'new'
        else
            render :new
        end
    end

    # GET /diaries/:id/edit
    def edit
        @diary = Diary.find(params[:id])
    end

    # PUT /diaries
    def update
        diary = Diary.find(params[:diary][:id])
        diary.update_attributes(diary_params)
        flash[:notice] = "punto editado con éxito."
        redirect_to :action => 'index'
    end

    # DELETE /diaries
    def destroy
        diary = Diary.find(params[:id])
        #if Diary.where(charge_id: diary).empty?
            diary.destroy
            flash[:notice] = "Punto eliminado con éxito."
            redirect_to :action => 'index'
        #else
        #    flash[:notice] = "el miembro a eliminar tiene elementos asociados."
        #    redirect_to :action => 'index'
        #end
    end

    private
    def diary_params
      params.require(:diary).permit(:discusion, :descripcion, :acuerdo, :meeting_id)
    end
end
