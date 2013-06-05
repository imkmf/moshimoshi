module Moshimoshi
  class API < Grape::API
    prefix "api"
    format :json
    resources :users do
      desc "Return a bio for a user."
      get '/show/:hash' do
        user = User.find_by_email_hash(params[:hash])
        unless user.nil?
          unless user.bio.blank?
            user.bio
          else
            return "This user has not set a bio yet."
          end
        else
          return nil
        end
      end
    end
  end
end
