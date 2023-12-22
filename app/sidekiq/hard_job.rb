class HardJob
  include Sidekiq::Job

  def perform(mensaje, nombre)
    # Do something
    puts "#{nombre} : #{mensaje}"
  end
end
