## MEMO
Rails version ? 
- Use **Mongoid** for SQL
- Use **Redis** for NOSQL Resque and cache
- Use **Elasticsearch** ... you know, for search. Maybe with **Chewy** ?
- Use **Devise** for administration loggin
- Use **Resque** or **Sidekiq** for joblist and cron
- Use **NetSftp** for pull and push ftp
- Use **Mediainfo** for metadata
- Use **Ffmpeg** for transcode
- Use **MP4BOX** for dash
- Use **WashOut** for webservices in : https://github.com/inossidabile/wash_out
- Use **Savon** for webservices out : https://github.com/savonrb/savon
- Use **PublicActivity** for notification : https://github.com/pokonski/public_activity
- Use **Grape** for webservices : https://github.com/intridea/grape
- Use **IBMWatson** or **NuanceDev** or **Authot** for Speech to Text 
 
Maybe switch to SailsJS ? 
- Use **Mongodb** for SQL
- Use **Redis** for NOSQL Resque and cache
- Use **Elasticsearch** ... you know, for search. Maybe with **Chewy** ?
- Use **Kue** for joblist and cron
- Use **Mediainfo** for metadata
- Use **Ffmpeg** and **BMX**  for transcode
- Use **MP4BOX** for dash
- Use **IBMWatson** or **NuanceDev** or **Authot** for Speech to Text 

## Database
* **Media** 
	* title:string:required
	* sort_id:integer:required
	* state_id:integer:required
	* tag_id:array
	* created_by:integer:required 
	* updated_by:integer:required
* **Link**
	* medium_id:integer:required
	* folder_id:integer:required
* **Object**
	* medium_id:integre:required
	* file_name:string:required
* **State** => CACHE
	* title:string:required
	* bg_color:string:required
	* bd_color:string:required
	* tx_color:string:required
* **Sort** => CACHE
	* title:string:required
	* icon:string:required
	* extension:array:required
* **Folder** => CACHE
	* title:string:required
	* parent_id:integer:required
* **Tag** => CACHE
	* title:string:required
	* bg_color:string:required
	* bd_color:string:required
	* tx_color:string:required
* **Import_Workflow** => CACHE
	* title:string:required
	* active:boolean:required
	* storage_path:string:required
	* folder_id:integer:required
* **Export_Workflow** => CACHE
	* title:string:required
	* active:boolean:required
	* folder_id:integer:required
	* storage_path:string:required
* **Purge_Workflow** => CACHE
	* title:string:required
	* active:boolean:required
	* recursive:boolean:required
	* folder_id:integer:required
	* day_offset:integer:required
* **Archive_Workflow** => CACHE
	* title:string:required
	* active:boolean:required
	* recursive:boolean:required
	* folder_id:integer:required
	* day_offset:integer:required
* **Setting** => CACHE
	* key:string:required
	* value:string:required
* **Metadata** 
	* medium_id:integer:required
	* key:string:required
	* value:string:required
* **Metadata_structure** => CACHE
	* key:string:required
	* title:string:required
	* metadata_tab_id:integer
* **Metadata_tab** => CACHE
	* title:string:required
* **Technical**
	* medium_id:integer:required
	* key:string:required
	* value:string:required
* **Technical_structure** => CACHE
	* key:string:required
	* title:string:required
* **Comment**
	* user_id:integer:required
	* medium_id:integer:required
	* content:text:required
* **User** => CACHE
	* GENERATE FROM DEVISE
	* user_groupe_id:integer:required
* **User_right** => CACHE
	* user_id:integer:required
	* folder_id:integer
	* key:string:required
	* value:string:required
* **User_group**
	* title:string:required
* **User_group_right** => CACHE
	* user_group_id:integer:required
	* folder_id:integer
	* key:string:required
	* value:string:required

## Users rights settings
- User_right settings overwrite the User_group_right settings

## Onsite storage
- Use a network storage mounted with NFS. With 26 letters we can reach 26 000 000 assets. Path look like :

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
- b2_account_id
- b2_application_key
- b2_bucket_id
- blacklist_ext

## Jobs
- hash_creator
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
- workflow

## Objects and Filename
- LR_1115.mpg => Lowres
- HR_1115.mxf => Hires
- MD_1115.xml => Metadata
- MT_1115.xml => Technical
- TH_1115.jpg => MainThumbnail
- TH_1_1115.jpg => SceneThumbnails
- ST_1115.srt => Subtitle
