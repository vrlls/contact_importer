class ImportContactJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ContactCreator.new(args[0]).call
  end
end
