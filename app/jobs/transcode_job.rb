class TranscodeJob < ActiveJob::Base

  require 'fileutils'

  queue_as :default

  def perform(medium_id, transcode_id)
    puts "----------------------------------------------------------------"
    puts "Performing transcode : " + medium_id
    puts "----------------------------------------------------------------"
    tmp_directory = "public/TMP/" + medium_id + "/"
    files = Dir.entries(tmp_directory).select {|f| !File.directory? f}
    @transcodes = Transcode.all.where(id: transcode_id)

    files.each do |file|
      @transcodes.each do |transcode|
        transcode_cmd = "ffmpeg -i " + tmp_directory + file + " " + transcode.profile + " " + tmp_directory + transcode.title + "_" + medium_id + ".mp4"
        system transcode_cmd
      end
    end
  end
end
