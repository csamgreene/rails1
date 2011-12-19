
class Document

  def self.write(name, content)

    File.open(Rails.root.join('public/docs', name + '.txt').to_s, 'wb') do |f|
      f.write(content)
    end
  end

  def self.read(name)

    File.read(Rails.root.join('public/docs', name + '.txt').to_s)
  end

  def self.publish(name)

    content = read(name)

    Prawn::Document.generate(Rails.root.join('public/pdfs', name + '.pdf')) do
      text(name)
      move_down 30
      text(content)
    end
  end
end

