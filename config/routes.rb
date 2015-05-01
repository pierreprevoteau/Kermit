Rails.application.routes.draw do
	require "resque_web"
	Kermit::Application.routes.draw do
	  mount ResqueWeb::Engine => "/resque_web"
	end
end
