class PagesController < ApplicationController
  def generate
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)	  
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
	  Resque.enqueue(Transcode, 30)
  end
end