
class WorkController < ApplicationController

  def index

    @workitems = Role.by_user(params[:username]).map { |role|
      RuoteKit.storage_participant.by_participant(role)
    }.reduce(&:+)
  end

  def show

    @workitem = RuoteKit.storage_participant.by_fei(params[:id])

    render_form_if_any
  end

  def update

    @workitem = RuoteKit.storage_participant.by_fei(params[:id])

    if params[:fields]
      @workitem.fields = Rufus::Json.decode(params[:fields])
    else
      params.keys.select { |k|
        k.to_s.match(/^field_/)
      }.each { |f|
        @workitem.fields[f.to_s[6..-1]] = params[f]
      }
    end

    if params[:commit] == 'proceed'

      RuoteKit.storage_participant.proceed(@workitem)

      flash[:notice] = "workitem #{params[:id]} proceeded"

    elsif params[:commit] == 'update'

      RuoteKit.storage_participant.update(@workitem)

      flash[:notice] = "workitem #{params[:id]} updated"
    end

    redirect_to work_path(params[:username])
  end

  protected

  def render_form_if_any

    forms = Rails.root.join('app/views/work/forms/')

    pname = @workitem.participant_name
    task = (@workitem.fields['params']['task'] || 'NONE').strip.gsub(' ', '_')

    [ "#{pname}__#{task}.erb", "#{task}.erb", "#{pname}.erb" ].each do |f|

      path = forms.join(f).to_s

      render :file => path if File.exist?(path)
    end
  end
end

