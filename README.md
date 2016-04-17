# MEMO

- TODO REMOVE DURATION * rails generate scaffold Media title:string sort_id:integer state_id:integer created_by:integer updated_by:integer tag_id:string
- rails generate scaffold Link medium_id:integer folder_id:integer
- rails generate scaffold State title:string bd_color:string
- rails generate scaffold Sort title:string icon:string
- rails generate scaffold Folder title:string parent_id:integer
- rails generate scaffold Tag title:string bg_color:string bd_color:string tx_color:string
- rails generate scaffold Workflow title:string kind:string active:boolean storage_folder:string db_folder:integer transcode_id:integer
- rails generate scaffold Setting key:string value:string
- rails generate scaffold Metadata medium_id:integer key:string value:string
- rails generate scaffold Technical medium_id:integer key:string value:string
- rails generate scaffold Transcode title:string profile:string
- rails generate scaffold Comment user_id:integer medium_id:integer content:text
- 
-----------------------------------------------
- Use **Postgre** for SQL
- Use **Redis** for NOSQL
- Use **Devise** for administration loggin
- Use **Resque** for joblist and cron
  - https://github.com/resque/resque-web
  - https://github.com/quirkey/resque-status
  - https://github.com/resque/resque-scheduler
  - https://github.com/thoward/resque-mission
  - https://github.com/ono/resque-cleaner
  - https://github.com/alanpeabody/resque-job-stats
  - https://github.com/kmullin/resque-sliders
  - https://github.com/ilyakatz/resque-history
- Use **NetSftp** for pull and push ftp
- Use **WashOut** for webservices
- Use **Savon** for webservices
- Use **Mediainfo** for metadata
- Use **Ffmpeg** and **Ffmbc** for transcode
- Use **MP4BOX** for dash
- Use **WashOut** for webservices in : https://github.com/inossidabile/wash_out
- Use **Savon** for webservices out : https://github.com/savonrb/savon
- Use **PublicActivity** for notification : https://github.com/pokonski/public_activity
- Use **Grape** for webservices : https://github.com/intridea/grape
  - http://www.synbioz.com/blog/api_ruby_rails_gem_grape
  - http://code.dblock.org/2011/05/04/grape-api-authentication-w-devise.html

------------------------------------

## Onsite storage

- Use a Nas storage mounted with CIFS. Path look like :

* 0/ROOT
* 1/TEMP
* 1/IN
* 1/OUT
* 1/STORAGE
* 2/A
* 3/1000
* 4/1115
* 5/TH1_1115.jpg
* 5/TH2_1115.jpg
* 5/HR_1115.mxf
* 5/LR_1115.mpeg
* 5/MD_1115.xml
* 2/B

## Offsite storage
Add support for Backblaze B2 cloud storage => realy affordable compared to AWS !
One private bucket per Kermit instance

### Onsite storage Settings
- nas_uri
- nas_username
- nas_password

### Offsite storage Settings
- b2_account_id
- b2_application_key
- b2_bucket_id
