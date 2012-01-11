
class WriteDocument
  include Ruote::LocalParticipant

  def on_workitem

    name = workitem.fields['doc_name']
    content = workitem.fields.delete('doc_content')

    Document.write(name, content)

    reply
  end

  def on_cancel

    # no need
  end
end

