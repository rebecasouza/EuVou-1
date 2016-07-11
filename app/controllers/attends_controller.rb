class AttendsController < ApplicationController
  before_action :set_attend, only: [:show, :update, :destroy]

  # GET /attends
  def index
    @attends = Attend.all

    render json: @attends
  end

  # GET /attends/1
  def show
    render json: @attend
  end

  # POST /attends
  def create
    @attend = Attend.new(attend_params)

    if @attend.save
      render json: @attend, status: :created, location: @attend
    else
      render json: @attend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attends/1
  def update
    if @attend.update(attend_params)
      render json: @attend
    else
      render json: @attend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attends/1
  def destroy
    @attend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend
      @attend = Attend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attend_params
      params.require(:attend).permit(:event_id)
    end
end
