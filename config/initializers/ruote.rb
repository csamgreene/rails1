
require 'ruote/storage/fs_storage'


#
# initialize engine

RuoteKit.engine = Ruote::Engine.new(
  Ruote::Worker.new(
    Ruote::FsStorage.new("ruote_work_#{Rails.env}")))

#
# register participants

RuoteKit.engine.register do
  write_document WriteDocument
  publish_document PublishDocument
  catchall
end

