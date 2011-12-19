
class FlowsController < ApplicationController

  def index

    @flows = Workflow.all
  end

  def launch

    wfid = Workflow.find(params[:id]).launch

    flash[:notice] = "launched new flow #{wfid}"

    redirect_to flows_path
  end
end

