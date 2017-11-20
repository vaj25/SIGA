class AdministrationController < ApplicationController
    #GET /administration
    def index
        
    end
    
    #GET /administration
    def show
        date = Date.today
        %x(bundle exec rake db:dump)
        send_file "#{Rails.root}/public/siga.dumo", :type => "application/sql", :filename => "siga"+date.strftime()+".sql"
    end

end