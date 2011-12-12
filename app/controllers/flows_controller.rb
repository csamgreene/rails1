
class FlowsController < ApplicationController

  def index

    @flows = Dir[Rails.root.join('flows/*.rad')].collect { |pa|
      File.basename(pa).split('.').first
    }
  end

  def launch

    wfid = RuoteKit.engine.launch(
      Rails.root.join('flows', params[:id] + '.rad').to_s)

    render :text => "launched new flow #{wfid}"
  end
end

