class Reports::IncomeSummaryController < ApplicationController
    #GET /income_summary
    def index
        @fecha_inicial = params[:fecha_inicial]
        @fecha_final = params[:fecha_final]
        time_range = @fecha_inicial..@fecha_final
        @incomes = Activity.joins(:collections).where(activities: { fecha_inicio: time_range }).select("
                        collections.descripcion, activities.tipo, activities.fecha_inicio, collections.concepto
                    ").paginate(:page => params[:page], :per_page => 1)
        
        respond_to do |format|
            format.html
            format.xlsx {
                response.headers['Content-Disposition'] = 'attachment; filename="resumen_ingreso.xlsx"'
            }
        end
    end
end