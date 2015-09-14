class Email
  @queue = :email

  def self.perform(seconds)
    sleep(seconds)
  end
end
