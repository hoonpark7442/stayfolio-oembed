class Seeder
  def create_if_none(klass)
    if klass.none?
      message = ["Creating", klass.name].compact.join(" ")
      puts "#{message}"
      yield
    else
      puts "#{klass.name} already exist."
    end
  end
end