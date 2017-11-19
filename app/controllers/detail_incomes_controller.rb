class DetailIncomesController < ApplicationController
 #GET /detail_incomes
    def index
        @detail_incomes = DetailIncome.all.order('id DESC')
    end

    #GET /detail_incomes/new
    def new
        @detail_income = DetailIncome.new
    end

    #POST /detail_incomes
    def create
        @detail_income = DetailIncome.new(detail_income_params);
        if @detail_income.save
            redirect_to :action => 'index'
        else
            render :new
        end
    end

    #GET /detail_incomes/:id/edit
    def edit
        @detail_income = DetailIncome.find(params[:id])
    end

    # PUT /detail_incomes
    def update
        detail_income = DetailIncome.find(params[:detail_income][:id])
        detail_income.update_attributes(detail_income_params)
        redirect_to :action => 'index'
    end

    # DELETE /detail_incomes
    def destroy
        detail_income = DetailIncome.find(params[:id])
        detail_income.destroy
        redirect_to :action => 'index'
    end

    private
    def detail_income_params
      params.require(:detail_income).permit(:cantidad, :precio, :tree_id)
    end
end
