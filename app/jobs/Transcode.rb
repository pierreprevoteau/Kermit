class Transcode
  @queue = :transcode

  def self.perform(seconds)
    sleep(seconds)
  end
end