class PagesController < ApplicationController
  def generate
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Move, 100)
	  Resque.enqueue(Move, 100)
	  Resque.enqueue(Move, 100)
	  Resque.enqueue(Move, 100)
	  Resque.enqueue(Move, 100)
	  Resque.enqueue(Email, 5)
	  Resque.enqueue(Email, 5)
	  Resque.enqueue(Email, 5)
	  Resque.enqueue(Email, 5)
	  Resque.enqueue(Email, 5)
	  Resque.enqueue(Notify, 10)
	  Resque.enqueue(Notify, 10)
	  Resque.enqueue(Notify, 10)
	  Resque.enqueue(Notify, 10)
  end
end
