
class Document

  def self.write(name, content)

    File.open(Rails.root.join('public/docs', name).to_s, 'wb') do |f|
      f.write(content)
    end
  end

  def self.publish(name)

    raise "implement me !"
  end
end

