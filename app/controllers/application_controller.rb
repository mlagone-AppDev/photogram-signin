class ApplicationController < ActionController::Base
  before_action(:load_current_user) #will run this action for everything defined herein 
  #before_action(:load_current_user, { :only => [:index, :show] }) #can run for only those specified
  #before_action(:load_current_user, { :except => [:create, :delete] }) #can run for everything except specified
  before_action(:force_sign_in)


  def load_current_user
    @current_user = User.where({ :id => session[:user_id] }).at(0)
  end

  def force_sign_in
    if @current_user == nil
      redirect_to("/sign_in", { :notice => "You have to sign in first." })
    end
  end 
end
