
require 'ostruct'


module ParticipantHelper

  def new_workitem(fields)

    OpenStruct.new(:fields => fields)
  end
end

# Mix me in when spec'ing participants.
#
module SpecParticipantMixin

  def reply

    # do nothing
  end
end

