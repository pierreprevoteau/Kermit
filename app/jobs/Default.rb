class Default
  @queue = :default

  def self.perform(seconds)
    sleep(seconds)
  end
end