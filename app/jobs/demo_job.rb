class DemoJob < ApplicationJob
  queue_as :default
 
  def perform(*guests)
    # puts 'DemoJob Start'
    # sleep 10
    # puts 'DemoJob Stop'
  end
end