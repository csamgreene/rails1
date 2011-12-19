
require 'spec_helper'


describe WriteDocument do

  before(:each) do
    class << subject; include(SpecParticipantMixin); end
  end

  after(:each) do
    system("rm #{Rails.root.join('public/docs/spec_*.txt')}")
  end

  it 'creates documents under public/docs/' do

    name = "spec_#{(Time.now.to_f * 10000).to_i}.txt"

    wi = new_workitem(
      'doc_name' => name,
      'doc_content' => 'lore ipsum')

    subject.workitem = wi
    subject.on_workitem

    File.read(Rails.root.join('public/docs', name)).should == 'lore ipsum'
  end
end

