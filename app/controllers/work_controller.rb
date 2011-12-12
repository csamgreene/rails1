
class WorkController < ApplicationController

  def index

    @workitems = RuoteKit.engine.storage_participant.by_participant(
      params[:username])
  end

  def show

    @workitem = RuoteKit.engine.storage_participant.by_fei(params[:id])
  end

  def update

    @workitem = RuoteKit.engine.storage_participant.by_fei(params[:id])
    @workitem.fields = Rufus::Json.decode(params[:fields])

    if params[:commit] == 'proceed'

      RuoteKit.engine.storage_participant.proceed(@workitem)

      flash[:notice] = "workitem #{params[:id]} proceeded"

    elsif params[:commit] == 'update'

      RuoteKit.engine.storage_participant.update(@workitem)

      flash[:notice] = "workitem #{params[:id]} updated"
    end

    redirect_to work_path(params[:username])
  end
end

