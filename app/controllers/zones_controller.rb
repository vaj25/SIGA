class ZonesController < ApplicationController
    #GET /zones
    def index
        @zones = Zone.all.order('id DESC')
    end

    #GET /zones/new
    def new
        @zone = Zone.new
    end

    #POST /zones
    def create
        @zone = Zone.new(zone_params);
        if @zone.save
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    # GET /zones/:id/edit
    def edit
        @zone = Zone.find(params[:id])
    end

    # PUT /zones
    def update
        zone = Zone.find(params[:zone][:id])
        zone.update_attributes(zone_params)
        redirect_to :action => 'index'
    end

    # DELETE /zones
    def destroy
        zone = Zone.find(params[:id])
        zone.destroy
        redirect_to :action => 'index'
    end

    private
    def zone_params
      params.require(:zone).permit(:nombre, :area)
    end
end