class PubPostsController < ApplicationController
# GET /posts
  # GET /posts.json
  def index
	@posts = Post.all
	if (params[:weblog_id] != nil)
			@posts = Post.find_all_by_weblog_id(params[:weblog_id])
	else
			@posts = Post.all
	end
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

end
