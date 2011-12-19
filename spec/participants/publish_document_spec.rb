
require 'spec_helper'


describe PublishDocument do

  before(:each) do
    class << subject; include(SpecParticipantMixin); end
  end

  after(:each) do
    system("rm #{Rails.root.join('public/docs/spec_*.txt')}")
    system("rm #{Rails.root.join('public/pdfs/spec_*.pdf')}")
  end

  it 'creates documents under public/docs/' do

    name = "spec_#{(Time.now.to_f * 10000).to_i}.txt"

    Document.write(name, 'honni soit qui mal y pense')

    wi = new_workitem('doc_name' => name)

    subject.workitem = wi
    subject.on_workitem

    File.read(
      Rails.root.join(
        'public/pdfs', File.basename(name, '.txt') + '.pdf')
    ).should_not == nil
  end
end

