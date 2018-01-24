# require '/app/pdfs/income_summary_pdf.rb'

class Reports::IncomeSummaryController < ApplicationController
    #GET /income_summary
    def index
        @fecha_inicial = params[:fecha_inicial]
        @fecha_final = params[:fecha_final]
        time_range = @fecha_inicial..@fecha_final
        name_user = current_user.name + " " + current_user.lastname

        respond_to do |format|
            format.html do
                @incomes = Activity.joins(:collections).where(activities: { fecha_inicio: time_range }).select("
                                collections.descripcion, activities.tipo, activities.fecha_inicio, collections.concepto
                            ").paginate(:page => params[:page], :per_page => 10)
            end
            format.xlsx {
                @incomes = Activity.joins(:collections).where(activities: { fecha_inicio: time_range }).select("
                collections.descripcion, activities.tipo, activities.fecha_inicio, collections.concepto")

                response.headers['Content-Disposition'] = 'attachment; filename="resumen_ingreso.xlsx"'
            }
            format.pdf do
                incomes = Activity.joins(:collections).where(activities: { fecha_inicio: time_range }).select("
                collections.descripcion, activities.tipo, activities.fecha_inicio, collections.concepto")
                
                pdf = Prawn::Document.new do
                    repeat :all do
                        move_down 15
                        text "Asociación Local Ecológica de Comunidades Unidas", :align => :center, :size => 16
                        move_down 3
                        text "A.L.E.C.U", :align => :center, :size => 16
                        image "#{Rails.root}/app/assets/images/logo_01.png", :position => :right, :vposition => :top, :width => 80
                    end

                    text "Reporte de resumen de ingresos", :align => :center, :size => 16
                    move_down 15

                    text "Parametros:", :size => 13
                    text "Fecha inicial: #{time_range.to_a[0]} - Fecha final: #{time_range.max}", :size => 12
                    text "Creado por: #{name_user}. Fecha de creación: #{Time.now.strftime "%d-%m-%Y"}"
                    move_down 15

                    cops = 0
                    incomes.each do |incom|
                        cops += incom.concepto
                    end

                    table = [["Descripción", "Actividad", "Fecha", "Concepto"]] +
                        incomes.map do |income|
                            [income.descripcion, income.tipo, income.fecha_inicio, income.concepto]
                        end
                    table << ["Total", "", "", cops]
                    table table, :position => :center, :width => 500

                    page_count.times do |i|
                        go_to_page(i+1)
                        draw_text "Página #{(i+1)} de #{page_count}", :at => [450, 0]
                    end

                end
                send_data pdf.render, type: 'application/pdf'
            end
        end
    end

end