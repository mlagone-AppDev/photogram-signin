class LikesController < ApplicationController
  before_action(:load_current_user) #will run this action for everything defined herein 
  #before_action(:load_current_user, { :only => [:index, :show] }) #can run for only those specified
  #before_action(:load_current_user, { :except => [:create, :delete] }) #can run for everything except specified


  def load_current_user
    @current_user = User.where({ :id => session[:user_id] }).at(0)
  end
  
  def index
    likes = Like.all.order({ :created_at => :asc })

    render({ :json => likes.as_json })
  end

  def show
    the_id = params.fetch(:the_like_id)
    like = Like.where({ :id => the_id }).at(0)

    render({ :json => like.as_json })
  end

  def create
    like = Like.new
    like.fan_id = params.fetch(:input_fan_id, nil)
    like.photo_id = session[:user_id]
    like.save

    respond_to do |format|
      format.json do
        render({ :json => like.as_json })
      end

      format.html do
        redirect_to("/photos/#{like.photo_id}")
      end
    end
  end

  def update
    the_id = params.fetch(:the_like_id)
    like = Like.where({ :id => the_id }).at(0)
    like.fan_id = params.fetch(:input_fan_id, nil)
    like.photo_id = params.fetch(:input_photo_id, nil)
    like.save

    render({ :json => like.as_json })
  end

  def destroy
    like = Like.find(params.fetch(:the_like_id)).destroy
    like.destroy

    render({ :json => like.as_json })
  end
end
