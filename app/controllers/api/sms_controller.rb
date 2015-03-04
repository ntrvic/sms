class Api::SmsController < BaseApiController
  require 'twilio-ruby'
  skip_before_filter :verify_authenticity_token, :only => [:index, :create]
  def create
    account_sid = 'AC80ab6fe0a311bdffe70940015a28e417' 
    auth_token = 'b5c81f502ef1f0340897c88ee90cd29d' 
 
    @client = Twilio::REST::Client.new account_sid, auth_token 
 
    response = @client.account.messages.create({
      :from => '+15005550006', 
      :to => params[:to], 
      :body => params[:body],  
    })

    if !response.nil?
      response_json = {:success => true, :status =>response.status, :from => response.from, :to => response.to, :body => response.body}
    end
  render json: response_json
  end

 end