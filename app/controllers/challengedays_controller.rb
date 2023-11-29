class ChallengedaysController < ApplicationController
  before_action :set_challengeday, only: %i[ show edit update destroy ]

  # GET /challengedays or /challengedays.json
  def index
    @challengedays = Challengeday.all
  end

  # GET /challengedays/1 or /challengedays/1.json
  def show
  end

  # GET /challengedays/new
  def new
    @challengeday = Challengeday.new
  end

  # GET /challengedays/1/edit
  def edit
  end

  # POST /challengedays or /challengedays.json
  def create
    @challengeday = Challengeday.new(challengeday_params)

    respond_to do |format|
      if @challengeday.save
        format.html { redirect_to challengeday_url(@challengeday), notice: "Challengeday was successfully created." }
        format.json { render :show, status: :created, location: @challengeday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @challengeday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challengedays/1 or /challengedays/1.json
  def update
    respond_to do |format|
      if @challengeday.update(challengeday_params)
        format.html { redirect_to challengeday_url(@challengeday), notice: "Challengeday was successfully updated." }
        format.json { render :show, status: :ok, location: @challengeday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @challengeday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challengedays/1 or /challengedays/1.json
  def destroy
    @challengeday.destroy

    respond_to do |format|
      format.html { redirect_to challengedays_url, notice: "Challengeday was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challengeday
      @challengeday = Challengeday.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challengeday_params
      params.require(:challengeday).permit(:challenge_id, :day_id)
    end
end
