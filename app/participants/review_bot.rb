
class ReviewBot
  include Ruote::LocalParticipant

  def on_workitem

    workitem.fields['review_bot'] = `fortune`.lines.first.strip

    reply
  end

  def on_cancel

    # no need
  end
end

