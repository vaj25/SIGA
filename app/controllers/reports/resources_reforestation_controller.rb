class Reports::ResourcesReforestationController < ApplicationController
    #GET /resource_reforestation
    def index
        @id_reforestacion = params[:id_reforestacion]
        name_user = current_user.name + " " + current_user.lastname


        respond_to do |format|
            format.html do
                @reforestatios = Activity.joins(:resource_activity).where(activities: { id: @id_reforestacion }).select("
                                resource_activities.descripcion, activities.fecha_inicio,
                                resource_activities.cantidad, resource_activities.precio
                            ").paginate(:page => params[:page], :per_page => 10)

                @trees = ResourceActivity.joins(resource_activities_tree: :tree).where(resource_activities: {activity_id: @id_reforestacion }).select("
                                resource_activities_trees.cantidad, resource_activities_trees.precio, trees.nombre_comun")

                @activity =Activity.find(@id_reforestacion) 
 
            end
            format.xlsx {
                @reforestations = Activity.joins(:resource_activity).where(activities: { id: @id_reforestacion }).select("
                                resource_activities.descripcion, activities.fecha_inicio,
                                resource_activities.cantidad, resource_activities.precio")

                @trees = ResourceActivity.joins(resource_activities_tree: :tree).where(resource_activities: {activity_id: @id_reforestacion }).select("
                                resource_activities_trees.cantidad, resource_activities_trees.precio, trees.nombre_comun")   

                @activity =Activity.find(@id_reforestacion)              
    

                response.headers['Content-Disposition'] = 'attachment; filename="recursos_reforestacion.xlsx"'

            }
            format.pdf do
                reforestations = Activity.joins(:resource_activity).where(activities: { id: @id_reforestacion }).select("
                                resource_activities.descripcion, activities.fecha_inicio,
                                resource_activities.cantidad, resource_activities.precio")

                trees = ResourceActivity.joins(resource_activities_tree: :tree).where(resource_activities: {activity_id: @id_reforestacion }).select("
                                resource_activities_trees.cantidad, resource_activities_trees.precio, trees.nombre_comun")

                @activity =Activity.find(@id_reforestacion) 

                cadena_param = 'Reforestación: ' + @activity.id.to_s + ', Fecha: ' + @activity.fecha_inicio.to_s + ', Zona: ' + @activity.zone.nombre.to_s
                
                pdf = Prawn::Document.new do
                    repeat :all do
                        move_down 15
                        text "Asociación Local Ecológica de Comunidades Unidas", :align => :center, :size => 16
                        move_down 3
                        text "A.L.E.C.U", :align => :center, :size => 16
                        image "#{Rails.root}/app/assets/images/logo_01.png", :position => :right, :vposition => :top, :width => 80
                    end

                    text "Reporte de recursos por reforestación.", :align => :center, :size => 16
                    move_down 15

                    text "Parametros:", :size => 13
                    text "#{cadena_param}" , :size => 12
                    text "Creado por: #{name_user}. Fecha de creación: #{Time.now.strftime "%d-%m-%Y"}"
                    move_down 15

                    cops = 0
                    tot = 0
                    reforestations.each do |incom|
                        cops += incom.precio
                    end

                    trees.each do |tree|
                        tot += tree.precio*tree.cantidad
                    end

                    table = [["Fecha", "Descripción", "Cantidad", "Precio"]] +
                        reforestations.map do |ref|
                            [ref.fecha_inicio, ref.descripcion, ref.cantidad, ref.precio]
                        end
                    table << ["Total", "", "", cops]
                    table << ["Detalle de árboles:"]
                    table table, :position => :center, :width => 500                    
                    
                    table = [["Nombre común", "Cantidad", "Precio"]] +
                        trees.map do |tree|
                            [tree.nombre_comun, tree.cantidad, tree.precio]
                        end
                    table << ["Total", "", tot]
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
    def new
         @activities = Activity.joins(:zone).where(activities: { tipo: 'Reforestación' }).select("activities.id,
            activities.fecha_inicio,zones.nombre")
    end

end