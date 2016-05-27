# KERMIT

## MEMO
Rails version :
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
- Use **IBMWatson** or **NuanceDev** or **Authot** for Speech to Text and Visual Recognition
 
SailsJS/AngularJS version
- Use **Mongodb** for SQL
- Use **Redis** for NOSQL Kue / cache / SocketIO
- Use **Elasticsearch** ... you know, for search. Maybe with **Chewy** ?
- Use **Kue** for joblist and cron
- Use **Mediainfo** for metadata
- Use **Ffmpeg** and **BMX**  for transcode
- Use **MP4BOX** for dash
- Use **IBMWatson** or **NuanceDev** or **Authot** for Speech to Text and Visual Recognition

----------------

## Database
* **Media** 

media_id match objects_id in the storage so that we don't need to store a path in DB.

Title | Type | Required
--- | --- | ---	
title | string | true
sort_id | integer | true
state_id | integer | true
tag_id | array | false
created_by | integer | true
updated_by | integer | true

* **Link**
 
A link refer to a media, links are stored in folders so that a media can be in two folder without the need to duplicate objects of the Media.

Title | Type | Required
--- | --- | ---	
medium_id | integer | true
folder_id | integer | true

* **Object**
 
An object is an associeted file to a medium (HR, LR, SRC, Thumb, alternative_res, metadata_file ...). Each are hashed to check concistency problem.

Title | Type | Required
--- | --- | ---	
medium_id | integer | true
object_type | integer | true
file_name | string | true
hash | string | false
archived | boolean | true

* **Object_type** => CACHE

Title | Type | Required
--- | --- | ---	
title | string | true
prefix | string | true

* **State** => CACHE

State of a media (online, offline, partial, archived ...) and associeted color.

Title | Type | Required
--- | --- | ---	
title | string | true
bg_color | string | false
bd_color | string | false
tx_color | string | false

* **Sort** => CACHE

Sort of a media (video, audio, project, image ...), associeted icon (from glyphicon/fontawsome in SVG) and whitelist extentions.

Title | Type | Required
--- | --- | ---	
title | string | true
icon | string | true
extension | array | true

* **Folder** => CACHE

Database folder where Medias are stored, in reality it store links who refer to medias.

Title | Type | Required
--- | --- | ---	
title | string | true
parent_id | integer | true

TODO : Add folder bg/bd/tx_color

* **Tag** => CACHE

Tags are metadatas associeted to a media who look likes AGENCY/RUSH/BADSHOT.
One media can have multiple tags.

Title | Type | Required
--- | --- | ---	
title | string | true
bg_color | string | true
bd_color | string | true
tx_color | string | true

* **Import_Workflow** => CACHE

Title | Type | Required
--- | --- | ---	
title | string | true
active | boolean | true
storage_path | string | true
folder_id | integer | true

* **Export_Workflow** => CACHE

Title | Type | Required
--- | --- | ---	
title | string | true
active | boolean | true
folder_id | integer | true
storage_path | string | true

* **Purge_Workflow** => CACHE

Title | Type | Required
--- | --- | ---	
title | string | true
active | boolean | true
recursive | boolean | true
folder_id | integer | true
day_offset | integer | true

* **Archive_Workflow** => CACHE
	
Title | Type | Required
--- | --- | ---	
title | string | true
active | boolean | true
recursive | boolean | true
folder_id | integer | true
day_offset | integer | true

* **Setting** => CACHE

Title | Type | Required
--- | --- | ---	
key | string | true
value | string | true

TODO : 

* **Metadata** 

Redactional metadata (journalist/GPS/cameraman) KEY (CAMERAMAN) VALUE (Toto BERANGER)

Title | Type | Required
--- | --- | ---	
medium_id | integer | true
key | string | true
value | string | true

* **Metadata_structure** => CACHE

Title of a metadata KEY (CAMERAMAN) TITLE (Nom du cameraman).
metadata_tab_id is used to organize metadata in tabs.

Title | Type | Required
--- | --- | ---	
key | string | true
title | string | true
metadata_tab_id | integer | false

* **Metadata_tab** => CACHE

Title of metadata tab used to organise metadata

Title | Type | Required
--- | --- | ---	
title | string | true

TODO : Add Metadata_tab bg/bd/tx_color

* **Technical**

Technical Metadata (Duration/Format) like Metadata
	
Title | Type | Required
--- | --- | ---	
medium_id | integer | true
key | string | true
value | string | true

* **Technical_structure** => CACHE

Like Metadata

Title | Type | Required
--- | --- | ---	
key | string | true
title | string | true

* **Comment**

Comment associeted to a Media from a user or from the server (history of the media, moved for folder, duplicated, archived)

Title | Type | Required
--- | --- | ---	
user_id | integer | true
medium_id | integer | true
content | text | true

* **User** => CACHE
	
Title | Type | Required
--- | --- | ---	
GENERATE FROM DEVISE | X | X
user_groupe_id | integer | true

* **User_right** => CACHE

Title | Type | Required
--- | --- | ---	
user_id | integer | true
folder_id | integer | false
key | string | true
value | string | true

* **User_group**

Title | Type | Required
--- | --- | ---	
title | string | true	

* **User_group_right** => CACHE

Title | Type | Required
--- | --- | ---	
user_group_id | integer | true
folder_id | integer | false
key | string | true
value | string | true

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
- hr_creator
- lr_creator
- object_creator
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
- TH1_1115.jpg => SceneThumbnails
- TH2_1115.jpg => SceneThumbnails
- ST_1115.srt => Subtitle
