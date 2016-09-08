require 'csv'

class LoadCsv
  def initialize(file_name, model)
    import(file_name, model)
  end

  def import(file_name, model)
    puts "#{model}s importing..."
    CSV.foreach("./db/data/#{file_name}.csv", headers: true) do |row|
      model.create!(row.to_h)
    end
    puts "#{model}s imported."
  end
end
