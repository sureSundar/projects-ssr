class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    if (params[:post_id] != nil)
		@comments = Comment.find_all_by_ppost_id(params[:post_id])
	else
		@comments = Comment.all
	end
	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    if (params[:post_id] != nil)
		@comment.ppost_id = params[:post_id]
	end
	if ( params[:comment_id] != nil) 
		@comment.ppost_id = Comment.find(params[:comment_id]).ppost_id
		@comment.pc_id = params[:comment_id]
	end
	
    respond_to do |format|
		if (current_user == nil)
			format.html { redirect_to :login, notice: 'Please login to comment.' }
		end
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    #@comment = Comment.new(params[:comment],:user_id => current_user.id,:ppost_id=> params[:ppost_id],:pc_id=>0)
	@comment = Comment.new(params[:comment])
	@comment.ppost_id=params[:ppost_id]
	@comment.pc_id=params[:pc_id]
	@comment.user_id = current_user.id
	
	respond_to do |format|
      if @comment.save
        # format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
	    format.html { redirect_to post_path(@comment.ppost_id), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
	post_id=@comment.ppost_id
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(post_id), notice: 'Comment was successfully Destroyed.' }
      format.json { head :ok }
    end
  end
end
