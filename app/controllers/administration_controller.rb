class AdministrationController < ApplicationController
    #GET /administration
    def index
        
    end
    
    #GET /administration
    def show
        date = Date.today
        %x(bundle exec rake db:dump)
        send_file "#{Rails.root}/public/siga.dump", :type => "application/sql", :filename => "siga"+date.strftime()+".dump"
    end

end