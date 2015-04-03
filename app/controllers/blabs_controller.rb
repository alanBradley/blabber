class BlabsController < ApplicationController
  before_action :set_blab, only: [:show, :edit, :update, :destroy]
  # added filter to stop non-users being able to delete blabs otherwise deletion of content could be done by anyone visiting the application. This code brings user back to index page if any blab option is clicked other than show and index
  # to be edited in views so links don't show.
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /blabs
  # GET /blabs.json
  def index
    @blabs = Blab.all
  end

  # GET /blabs/1
  # GET /blabs/1.json
  def show
  end

  # GET /blabs/new
  def new
    @blab = current_user.blabs.build
  end

  # GET /blabs/1/edit
  def edit
  end

  # POST /blabs
  # POST /blabs.json
  def create
    @blab = current_user.blabs.build(blab_params)

    respond_to do |format|
      if @blab.save
        format.html { redirect_to @blab, notice: 'Blab was successfully created.' }
        format.json { render :show, status: :created, location: @blab }
      else
        format.html { render :new }
        format.json { render json: @blab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blabs/1
  # PATCH/PUT /blabs/1.json
  def update
    respond_to do |format|
      if @blab.update(blab_params)
        format.html { redirect_to @blab, notice: 'Blab was successfully updated.' }
        format.json { render :show, status: :ok, location: @blab }
      else
        format.html { render :edit }
        format.json { render json: @blab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blabs/1
  # DELETE /blabs/1.json
  def destroy
    @blab.destroy
    respond_to do |format|
      format.html { redirect_to blabs_url, notice: 'Blab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # upvote and downvote methods with redirect to back button
  def upvote
    @blab = Blab.find(params[:id])
    @blab.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @blab = Blab.find(params[:id])
    @blab.downvote_by current_user
    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blab
      @blab = Blab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blab_params
      params.require(:blab).permit(:title, :body, :url)
    end
end
