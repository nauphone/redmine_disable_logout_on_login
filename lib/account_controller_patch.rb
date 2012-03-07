module DisableLogoutOnLogin
  module AccountPatch
    def self.included base
      base.class_eval do
        alias :original_login :login
        def login
          if User.current.anonymous?
            original_login
          else
            redirect_back_or_default :controller => 'my', :action => 'page'
          end
        end
      end
    end
  end
end
