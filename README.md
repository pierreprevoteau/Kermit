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

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true | "Visite Holland London" | Title of a media
sort_id | integer | true | "1" | Sort id, refer to the Sort model, can be a Video/Audio/Image/Project...
state_id | integer | true | "2" | State id, refer to the State model, can be Online/Offline/Partial/Archived...
tag_id | array | false | "2:5:8:12" | Tag ids, refer to the Tag model, can be multiple Agency/Rush/Badshoot...
created_by | integer | true | "15" | User id, refer to the User model, User who create the Media
updated_by | integer | true | "16" | User id, refer to the User model, last User who update the Media

* **Link**
 
A link refer to a media, links are stored in folders so that a media can be in two folder without the need to duplicate objects of the Media.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
medium_id | integer | true | "12" | Medium id, refer to the Medium model
folder_id | integer | true | "3" | Folder id, refer to the Folder model

* **Object**
 
An object is an associeted file to a medium (HR, LR, SRC, Thumb, alternative_res, metadata_file ...). Each are hashed to check concistency problem.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
medium_id | integer | true | "5" | Medium id, refer to the Medium model
object_type_id | integer | true | "7" | Refer to the Object_type model
file_name | string | true | "THB_1554.jpg" | Filename with extention of the file in the storage
hash | string | false | "df5gd4dfg6df8df52dfg987js32" | Hash of the file
status | string | true | "online" | Status of the file, "online" if the file is present, "offline" if not, or "archived" if file not present in the storage but is in Backblaze

* **Object_type** => CACHE

Object type (HR/LR/PROJ/THUMB) with prefix (before the id in the filename) and whitelist extentions.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true | "Video HR" |
prefix | string | true | "HR" |
extension | array | true | "mxf:mov" |

* **State** => CACHE

State of a media (online, offline, partial, archived ...) and associeted color.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
bg_color | string | false
bd_color | string | false
tx_color | string | false

* **Sort** => CACHE

Sort of a media (video, audio, project, image ...), associeted icon (from glyphicon/fontawsome in SVG) and whitelist extentions.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
icon | string | true
extension | array | true

* **Folder** => CACHE

Database folder where Medias are stored, in reality it store links who refer to medias.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
parent_id | integer | true

TODO : Add folder bg/bd/tx_color

* **Tag** => CACHE

Tags are metadatas associeted to a media who look likes AGENCY/RUSH/BADSHOT.
One media can have multiple tags.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
bg_color | string | true
bd_color | string | true
tx_color | string | true

* **Import_Workflow** => CACHE

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
active | boolean | true
storage_path | string | true
folder_id | integer | true

* **Export_Workflow** => CACHE

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
active | boolean | true
folder_id | integer | true
storage_path | string | true

* **Purge_Workflow** => CACHE

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
active | boolean | true
recursive | boolean | true
folder_id | integer | true
day_offset | integer | true

* **Archive_Workflow** => CACHE
	
Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true
active | boolean | true
recursive | boolean | true
folder_id | integer | true
day_offset | integer | true

* **Setting** => CACHE

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
key | string | true
value | string | true

TODO : add optional folder_id/wf_id/...

* **Metadata** 

Redactional metadata (journalist/GPS/cameraman) KEY (CAMERAMAN) VALUE (Toto BERANGER)

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
medium_id | integer | true
key | string | true
value | string | true

* **Metadata_structure** => CACHE

Title of a metadata KEY (CAMERAMAN) TITLE (Nom du cameraman).
metadata_tab_id is used to organize metadata in tabs.

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
key | string | true
title | string | true
metadata_tab_id | integer | false

* **Metadata_tab** => CACHE

Title of metadata tab used to organise metadata

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true

TODO : Add Metadata_tab bg/bd/tx_color

* **Technical**

Technical Metadata (Duration/Format) like Metadata
	
Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
medium_id | integer | true
key | string | true
value | string | true

* **Technical_structure** => CACHE

Like Metadata

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
key | string | true
title | string | true

* **Comment**

Comment associeted to a Media from a user or from the server (history of the media, moved for folder, duplicated, archived)

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
user_id | integer | true
medium_id | integer | true
content | text | true

* **User** => CACHE
	
Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
GENERATE FROM DEVISE | X | X
user_groupe_id | integer | true

* **User_right** => CACHE

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
user_id | integer | true
folder_id | integer | false
key | string | true
value | string | true

* **User_group**

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
title | string | true	

* **User_group_right** => CACHE

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
user_group_id | integer | true
folder_id | integer | false
key | string | true
value | string | true

* **Locator**

Title | Type | Required | Example | Info
--- | --- | ---	| --- | ---
medium_id | integer | true
timecode | string | true
title | string | true
bg_color | string | true
bd_color | string | true
tx_color | string | true

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
- LR_1115.mpg => Low res
- HR_1115.mxf => Hi res
- SRC_1115.mxf => Source res
- MD_1115.xml => Metadata
- MT_1115.xml => Technical
- TH_1115.jpg => MainThumbnail
- TH1_1115.jpg => SceneThumbnails
- TH2_1115.jpg => SceneThumbnails
- ST_1115.srt => Subtitle
- DIFF_1115.mxf => Alternative res
- PROJ_1115.avp => Projet montage

## Component
- Frontend
- Backend
- Worker
- Mongo
- Redis
- ElasticSearch
