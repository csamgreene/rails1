
class Workflow

  attr_reader :name, :path

  def self.all

    Dir[Rails.root.join('flows/*.rad')].collect { |pa|
      File.basename(pa).split('.').first
    }.collect { |name|
      Workflow.new(name)
    }
  end

  def self.find(name)

     Workflow.new(name)
  end

  def initialize(name)

    @name = name
    @path = Rails.root.join('flows', @name + '.rad').to_s
  end

  def launch(initial_fields={})

    RuoteKit.engine.launch(@path, initial_fields)
  end
end

