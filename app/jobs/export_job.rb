class ExportJob < ActiveJob::Base
  require 'fileutils'

  queue_as :default

  def perform(medium_id, workflow_id)

    @medium = Medium.find(medium_id)
    @workflow = Workflow.find(workflow_id)

    puts "----------------------------------------------------------------"
    puts "Performing " + @workflow.kind + " : " + @workflow.title
    puts "----------------------------------------------------------------"

    

  end
end
