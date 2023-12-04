class MainController < ApplicationController
  def welcome
  end

  def get_children
    @children = Child.where(:user_id => current_user.id)
    render "children/index"
  end

  def show
    child_id = params.fetch(:child_id)
    @child = Child.find_by(id: child_id, user_id: current_user.id)
    @challenges = Challenge.all
    # @day = Challengeday.find(params[:day_id])
    render "children/show"
  end

  def challenges_show
    child_id = params.fetch(:child_id)
    @child = Child.where(:id => child_id)[0]
    challenge_id = params.fetch(:ch_id)
    # @challenge = Challenge.where(:id => challenge_id)[0]

    render "challenges/show"
  end

  def show_day
    child_id = params.fetch(:child_id)
    @child = Child.where(:id => child_id)[0]
    challenge_id = params.fetch(:ch_id)
    @challenge = Challenge.where(:id => challenge_id)[0]
    day_id = params.fetch(:day_id)
    @day = Day.where(:id => day_id)[0]
    @challenge_day = Challengeday.where(challenge_id: ).where(day_id: )
    
    @progress = Progress.new
    
    render "days/show"

  end

end
