## MEMO
- Use **Postgre** or **Crate.io** for SQL
- Use **Redis** for NOSQL Resque and cache
- Use **Elasticsearch** for search
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
- Use **IBMWatson** for Speech to Text 

## Database
- rails generate scaffold Media title:string sort_id:integer state_id:integer created_by:integer updated_by:integer tag_id:array
- rails generate scaffold Link medium_id:integer folder_id:integer 
- rails generate scaffold Object medium_id:integer file_name:string 
- rails generate scaffold State title:string bg_color:string bd_color:string tx_color:string => CACHE
- rails generate scaffold Sort title:string icon:string extension:string => CACHE
- rails generate scaffold Folder title:string parent_id:integer => CACHE
- rails generate scaffold Tag title:string bg_color:string bd_color:string tx_color:string => CACHE
- rails generate scaffold Import_Workflow title:string active:boolean storage_path:string folder_id:integer => CACHE
- rails generate scaffold Export_Workflow title:string active:boolean folder_id:integer storage_path:string => CACHE
- rails generate scaffold Purge_Workflow title:string active:boolean folder_id:integer day_offset:integer => CACHE
- rails generate scaffold Archive_Workflow title:string active:boolean folder_id:integer day_offset:integer => CACHE
- rails generate scaffold Setting key:string value:string => CACHE
- rails generate scaffold Metadata medium_id:integer key:string value:string
- rails generate scaffold Metadata_structure key:string title:string => CACHE
- rails generate scaffold Technical medium_id:integer key:string value:string
- rails generate scaffold Technical_structure key:string title:string => CACHE
- rails generate scaffold Comment user_id:integer medium_id:integer content:text
- rails generate scaffold User GENERATE FROM DEVISE + user_groupe_id:integer => CACHE
- rails generate scaffold User_group title:string => CACHE
- rails generate scaffold User_group_right user_group_id:integer folder_id:integer key:string value:string => CACHE

## Onsite storage
- Use a Nas storage mounted with CIFS. With 26 letters we can reach 26 000 000 assets. Path look like :

* /ROOT
* /ROOT/TEMP
* /ROOT/IN
* /ROOT/OUT
* /ROOT/STORAGE
* /ROOT/STORAGE/A
* /ROOT/STORAGE/A/1000
* /ROOT/STORAGE/A/1000/1115
* /ROOT/STORAGE/A/1000/1115/TH1_1115.jpg
* /ROOT/STORAGE/A/1000/1115/TH2_1115.jpg
* /ROOT/STORAGE/A/1000/1115/HR_1115.mxf
* /ROOT/STORAGE/A/1000/1115/LR_1115.mpeg
* /ROOT/STORAGE/A/1000/1115/MD_1115.xml
* /ROOT/STORAGE/A/2000
* /ROOT/STORAGE/B

## Offsite storage
Add support for Backblaze B2 cloud storage => realy affordable compared to AWS !
One private bucket per Kermit instance.

## Settings
- nas_uri
- nas_username
- nas_password
- b2_account_id
- b2_application_key
- b2_bucket_id
- lr_profile
- hr_profile
- blacklist_ext

## Jobs
- hash_creator
- hash_checker
- concistancy_checker
- thumb_creator
- duration_creator
- workflow_importer
- workflow_exporter
- workflow_purger
- workflow_archiver

## States
- 0:offline
- 1:online
- 2:archive
- 3:partial

## Sorts
- 0:video
- 1:audio
- 2:image

## User_right (chmod like rwx)
- folder
- media
- meta
- comment

## Objects and Filename
- LR_1115.mpg => Lowres
- HR_1115.mxf => Hires
- MD_1115.xml => Metadata
- MT_1115.xml => Technical
- TH_1115.jpg => MainThumbnail
- TH1_1115.jpg => SceneThumbnails
- ST_1115.srt => Subtitle