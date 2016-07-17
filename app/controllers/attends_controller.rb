class AttendsController < ApplicationController

  def index

  end

  def create

  end

  def destroy
    
  end

  private
    # Only allow a trusted parameter "white list" through.
    def attend_params
      params.require(:attend).permit(:event_id)
    end
end
