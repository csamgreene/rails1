
require 'ruote/storage/fs_storage'


#
# initialize engine

RuoteKit.engine = Ruote::Engine.new(
  Ruote::Worker.new(
    Ruote::FsStorage.new("ruote_work_#{Rails.env}")))

#
# register participants

RuoteKit.engine.register do
  review_bot ReviewBot
  catchall
end

