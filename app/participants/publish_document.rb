
class PublishDocument
  include Ruote::LocalParticipant

  def on_workitem

    Document.publish(workitem.fields['doc_name'])

    reply
  end

  def on_cancel

    # no need
  end
end

