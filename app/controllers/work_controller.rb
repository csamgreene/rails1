
class WorkController < ApplicationController

  def index

    @workitems = Role.by_user(params[:username]).map { |role|
      RuoteKit.storage_participant.by_participant(role)
    }.reduce(&:+)
  end

  def show

    @workitem = RuoteKit.storage_participant.by_fei(params[:id])
  end

  def update

    @workitem = RuoteKit.storage_participant.by_fei(params[:id])
    @workitem.fields = Rufus::Json.decode(params[:fields])

    if params[:commit] == 'proceed'

      RuoteKit.storage_participant.proceed(@workitem)

      flash[:notice] = "workitem #{params[:id]} proceeded"

    elsif params[:commit] == 'update'

      RuoteKit.storage_participant.update(@workitem)

      flash[:notice] = "workitem #{params[:id]} updated"
    end

    redirect_to work_path(params[:username])
  end
end

