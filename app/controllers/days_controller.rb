class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update destroy ]

  # GET /days or /days.json
  def index
    @child = Child.find(params[:child_id])
    @challenge = Challenge.find(params[:challenge_id])
    @days = @challenge.challenges_days
  end

  # GET /days/1 or /days/1.json
  def show
    @child = Child.find(params[:child_id])
    @challenge = @challenges.challenge_days.find(params[:challenge_id])
    @day = Challengeday.find(params[:day_id])
  end

  def show_current_challenge
    @challenge_id = params.fetch(:ch_id)
    @day_id = params.fetch(:day_id)
    render "days/show"
  end

  # GET /days/new
  def new
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days or /days.json
  def create
    @day = Day.new(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to day_url(@day), notice: "Day was successfully created." }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1 or /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to day_url(@day), notice: "Day was successfully updated." }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1 or /days/1.json
  def destroy
    @day.destroy

    respond_to do |format|
      format.html { redirect_to days_url, notice: "Day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_params
      params.fetch(:day, {})
    end
end
