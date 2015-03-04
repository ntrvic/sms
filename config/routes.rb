Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    post "/sms/create", to: "sms#create"
  end
end
