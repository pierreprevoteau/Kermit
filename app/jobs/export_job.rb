class ExportJob < ActiveJob::Base
  include PathFinder
  require 'fileutils'

  queue_as :default

  def perform(medium_id, workflow_id)

    @medium = Medium.find(medium_id)
    @workflow = Workflow.find(workflow_id)

    puts "----------------------------------------------------------------"
    puts "Performing " + @workflow.kind + " : " + @workflow.title
    puts "----------------------------------------------------------------"

    PathFinder.get_tmp_path(@medium.id)

    puts tagada
    puts tmp_directory

  end
end
