class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update destroy ]

  # GET /days or /days.json
  def index
    @challenge = Challenge.find(params.fetch("challenge_id"))
    @child = Child.find(params.fetch("child_id"))
    @days = @challenge.days
    @child_progress_num = 0

    @days.each do|day| 

      challenge_day = Challengeday.where(challenge_id:params.fetch("challenge_id") ).where(day_id: day.id ).at(0)

      if challenge_day && @child.progresses.exists?(challenge_day_id: challenge_day)
        @child_progress_num += 1
      end

    end

    @progress_percent = (@child_progress_num / @days.count.to_f) * 100
  end

  # GET /days/1 or /days/1.json
  def show
  end

  # GET /days/new
  def new
    @day = Day.new
    @challenge = Challenge.find(params.fetch("challenge_id"))
    
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
