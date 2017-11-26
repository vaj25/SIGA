class Reports::AdquisitionTreeController < ApplicationController
    #GET /adquisition_tree
    def index
        @fecha_inicial = params[:fecha_inicial]
        @fecha_final = params[:fecha_final]
        time_range = @fecha_inicial..@fecha_final
        name_user = current_user.name + " " + current_user.lastname

        respond_to do |format|
            format.html do
                @adquisitions = Tree.select("nombre_comun, cantidad, precio, created_at
                            ").paginate(:page => params[:page], :per_page => 10)
            end
            format.xlsx {
                @adquisitions = Tree.select("nombre_comun, cantidad, precio, created_at")

                response.headers['Content-Disposition'] = 'attachment; filename="resumen_arboles.xlsx"'
            }
            format.pdf do
                adquisitions = Tree.select("nombre_comun, cantidad, precio, created_at")
                
                pdf = Prawn::Document.new do
                    repeat :all do
                        move_down 15
                        text "Asociación Local Ecológica de Comunidades Unidas", :align => :center, :size => 16
                        move_down 3
                        text "A.L.E.C.U", :align => :center, :size => 16
                        image "#{Rails.root}/app/assets/images/logo_01.png", :position => :right, :vposition => :top, :width => 80
                    end

                    text "Reporte de adquisicion de arboles", :align => :center, :size => 16
                    move_down 15

                    text "Parametros:", :size => 13
                    text "Fecha inicial: #{time_range.to_a[0]} - Fecha final: #{time_range.max}", :size => 12
                    text "Creado por: #{name_user}. Fecha de creación: #{Time.now.strftime "%d-%m-%Y"}"
                    move_down 15


                    table = [["Nombre comun", "Cantidad", "Precio", "Fecha de adquision"]] +
                        adquisitions.map do |adqui|
                            [adqui.nombre_comun, adqui.cantidad, adqui.precio, adqui.created_at]
                        end  
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