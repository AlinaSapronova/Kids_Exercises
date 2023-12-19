class ProgressesController < ApplicationController
  before_action :set_progress, only: %i[ show edit update destroy ]
  skip_after_action :verify_authorized

  # GET /progresses or /progresses.json
  def index
    @child = Child.where(:user_id => current_user.id)
    @progresses = Progress.where(child_id: @child)
  end

  # GET /progresses/1 or /progresses/1.json
  def show
    @child = Child.all
   
  end

  # GET /progresses/new
  def new
    challenge_day_id = params[:challenge_day_id]
    @progress = Progress.new(challenge_day_id: challenge_day_id)
  end

  # GET /progresses/1/edit
  def edit
  end

  # POST /progresses or /progresses.json
  def create
    @progress = Progress.new(progress_params)
    respond_to do |format|
      if @progress.save
        format.html 
        fallback_location = request.referrer
        redirect_back(fallback_location: fallback_location, notice: "Progress was successfully created.")
        format.json { render :show, status: :created, location: @progress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progresses/1 or /progresses/1.json
  def update
    respond_to do |format|
      if @progress.update(progress_params)
        format.html { redirect_to progress_url(@progress), notice: "Progress was successfully updated." }
        format.json { render :show, status: :ok, location: @progress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progresses/1 or /progresses/1.json
  def destroy
    @progress.destroy

    respond_to do |format|
      format.html { redirect_to progresses_url, notice: "Progress was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress
      @progress = Progress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def progress_params
      params.require(:progress).permit(:challenge_day_id, :child_id)
    end
end
