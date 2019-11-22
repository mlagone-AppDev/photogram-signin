class CommentsController < ApplicationController
  def index
    comments = Comment.all.order({ :created_at => :asc })

    render({ :json => comments.as_json })
  end

  def show
    the_id = params.fetch(:the_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    render({ :json => comment.as_json })
  end

  def create
    comment = Comment.new

    comment.author_id = @current_user.id
    comment.photo_id = params.fetch(:input_photo_id, nil)
    comment.body = params.fetch(:input_body, nil)

    comment.save

    respond_to do |format|
      format.json do
        render({ :json => comment.as_json })
      end

      format.html do
        redirect_to("/photos/#{comment.photo_id}")
      end
    end
  end

  def update
    the_id = params.fetch(:the_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    comment.author_id = params.fetch(:input_author_id, comment.author_id)
    comment.photo_id = params.fetch(:input_photo_id, comment.photo_id)
    comment.body = params.fetch(:input_body, comment.body)

    comment.save

    render({ :json => comment.as_json })
  end

  def destroy
    the_id = params.fetch(:the_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    comment.destroy

    render({ :json => comment.as_json })
  end

end
