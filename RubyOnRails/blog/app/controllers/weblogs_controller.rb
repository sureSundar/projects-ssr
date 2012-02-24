class WeblogsController < ApplicationController
  # GET /weblogs
  # GET /weblogs.json
  def weblogindexbyuser
    @weblog = Weblog.find(@user_session.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weblogs }
    end
  end

  # GET /weblogs
  # GET /weblogs.json

  def index
    @weblogs = Weblog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weblogs }
    end
  end

  # GET /weblogs/1
  # GET /weblogs/1.json
  def show
    #@weblog = Weblog.findbyuser(params[:id])
	@weblogs = Weblog.find_all_by_owner_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weblog }
    end
  end

  # GET /weblogs/new
  # GET /weblogs/new.json
  def new
    @weblog = Weblog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weblog }
    end
  end

  # GET /weblogs/1/edit
  def edit
    @weblog = Weblog.find(params[:id])
  end

  # POST /weblogs
  # POST /weblogs.json
  def create
    @weblog = Weblog.new(params[:weblog])

    respond_to do |format|
      if @weblog.save
        format.html { redirect_to @weblog, notice: 'Weblog was successfully created.' }
        format.json { render json: @weblog, status: :created, location: @weblog }
      else
        format.html { render action: "new" }
        format.json { render json: @weblog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weblogs/1
  # PUT /weblogs/1.json
  def update
    @weblog = Weblog.find(params[:id])

    respond_to do |format|
      if @weblog.update_attributes(params[:weblog])
        format.html { redirect_to @weblog, notice: 'Weblog was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @weblog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weblogs/1
  # DELETE /weblogs/1.json
  def destroy
    @weblog = Weblog.find(params[:id])
    @weblog.destroy

    respond_to do |format|
      format.html { redirect_to weblogs_url }
      format.json { head :ok }
    end
  end
end
