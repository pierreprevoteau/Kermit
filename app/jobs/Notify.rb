class Notify
  @queue = :notify

  def self.perform(seconds)
    sleep(seconds)
  end
end
