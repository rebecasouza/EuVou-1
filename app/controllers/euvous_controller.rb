class EuvousController < ApplicationController
  before_action :set_euvou, only: [:show, :update, :destroy]

  # GET /euvous
  def index
    @euvous = Euvou.all

    render json: @euvous
  end

  # GET /euvous/1
  def show
    render json: @Euvou
  end

  # POST /euvous
  def create
    @Euvou = Euvou.new(Euvou_params)

    if @Euvou.save
      render json: @Euvou, status: :created, location: @Euvou
    else
      render json: @Euvou.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /euvous/1
  def update
    if @Euvou.update(Euvou_params)
      render json: @Euvou
    else
      render json: @Euvou.errors, status: :unprocessable_entity
    end
  end

  # DELETE /euvous/1
  def destroy
    @Euvou.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_euvou
      @Euvou = Euvou.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def Euvou_params
      params.require(:Euvou).permit(:user_id, :event_id)
    end
end
