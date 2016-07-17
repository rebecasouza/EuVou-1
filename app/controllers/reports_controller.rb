class ReportsController < ApplicationController

  def index
    
  end

  def create

  end

  def destroy

  end

  private
    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:event_id)
    end
end
