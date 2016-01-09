class ImportJob < ActiveJob::Base
  queue_as :default

  def perform(title, kind, storage_folder, db_folder)
    puts "----------------------------------------------------------------"
    puts "Performing " + kind + " : " + title
    puts "----------------------------------------------------------------"

    ingest_directory = 'public/IN/'+ storage_folder + '/'
    video_extensions = [".mp4", ".mxf"]
    audio_extensions = [".mp3", ".wav"]

    if Dir[ingest_directory + '*'].empty?
      puts "Nothing to import"
      exit
    end

    files = Dir.entries(ingest_directory).select {|f| !File.directory? f}

    files.each do |file|

      file_extname = File.extname(file)
      file_basename = File.basename(file, ".*")

      if (video_extensions.include? file_extname)
        sort = 1
      elsif (audio_extensions.include? file_extname)
        sort = 2
      end

      @medium = Medium.new(title: file_basename, sort_id: sort, state_id: '2', created_by: '1', updated_by: '1', tag_id: '1', duration: '00:00:00:00')
      @medium.save

      @link = Link.new(folder_id: db_folder, medium_id: @medium.id)
      @link.save

    end
  end
end
