
require 'spec_helper'


describe 'simple_publication.rad flow' do

  before(:each) do
    RuoteKit.engine.storage.clear
  end

  after(:each) do
    RuoteKit.engine.storage.clear
    system("rm #{Rails.root.join('public/docs/flow_spec_*.txt')}")
    system("rm #{Rails.root.join('public/pdfs/flow_spec_*.pdf')}")
  end

  it 'generates pdfs' do

    wfid = RuoteKit.engine.launch(
      Rails.root.join('flows/simple_publication.rad').to_s)

    RuoteKit.engine.wait_for(:author)
    wi = RuoteKit.storage_participant.first

    doc_name = "flow_spec_#{(Time.now.to_f * 1000).to_i}"

    wi.fields['doc_name'] = doc_name
    wi.fields['doc_content'] = 'hello world'
    RuoteKit.storage_participant.proceed(wi)

    RuoteKit.engine.wait_for(:reviewer)
    wi = RuoteKit.storage_participant.first

    Document.read(doc_name).should == 'hello world'

    wi.fields['approved'] = true
    RuoteKit.storage_participant.proceed(wi)

    RuoteKit.engine.wait_for(:publisher)
    wi = RuoteKit.storage_participant.first

    RuoteKit.storage_participant.proceed(wi)

    RuoteKit.engine.wait_for(wfid)

    File.exist?(
      Rails.root.join('public/pdfs/', doc_name + '.pdf')
    ).should == true
  end
end

