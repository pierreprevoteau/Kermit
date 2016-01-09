# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160109175233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "folder_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "folder_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "folder_anc_desc_idx", unique: true, using: :btree
  add_index "folder_hierarchies", ["descendant_id"], name: "folder_desc_idx", using: :btree

  create_table "folders", force: :cascade do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer  "medium_id"
    t.integer  "folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "title"
    t.integer  "sort_id"
    t.integer  "state_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "tag_id"
    t.string   "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metadata", force: :cascade do |t|
    t.integer  "medium_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sorts", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "title"
    t.string   "bd_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.string   "bg_color"
    t.string   "bd_color"
    t.string   "tx_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technicals", force: :cascade do |t|
    t.integer  "medium_id"
    t.string   "item"
    t.string   "general_format_media"
    t.string   "general_commercial_name_media"
    t.string   "general_format_profile_media"
    t.string   "general_format_settings_media"
    t.string   "general_file_size_media"
    t.string   "general_duration_media"
    t.string   "general_overall_bit_rate_media"
    t.string   "general_encoded_date_media"
    t.string   "general_writing_application_media"
    t.string   "general_writing_library_media"
    t.string   "video_id_media"
    t.string   "video_format_media"
    t.string   "video_commercial_name_media"
    t.string   "video_format_version_media"
    t.string   "video_format_profile_media"
    t.string   "video_bvop_media"
    t.string   "video_matrix_media"
    t.string   "video_gop_media"
    t.string   "video_wrapping_media"
    t.string   "video_duration_media"
    t.string   "video_bit_rate_media"
    t.string   "video_width_media"
    t.string   "video_height_media"
    t.string   "video_display_aspect_ratio_media"
    t.string   "video_frame_rate_media"
    t.string   "video_color_space_media"
    t.string   "video_chroma_subsampling_media"
    t.string   "video_bit_depth_media"
    t.string   "video_scan_type_media"
    t.string   "video_compression_mode_media"
    t.string   "video_ratio_bits_pixel_frame_media"
    t.string   "video_tc_first_frame_media"
    t.string   "video_tc_source_media"
    t.string   "video_stream_size_media"
    t.string   "audio1_id_media"
    t.string   "audio1_format_media"
    t.string   "audio1_endianness_media"
    t.string   "audio1_wrapping_media"
    t.string   "audio1_duration_media"
    t.string   "audio1_bit_rate_mode_media"
    t.string   "audio1_bit_rate_media"
    t.string   "audio1_channel_media"
    t.string   "audio1_sampling_rate_media"
    t.string   "audio1_bit_depth_media"
    t.string   "audio1_streaming_size_media"
    t.string   "audio2_id_media"
    t.string   "audio2_format_media"
    t.string   "audio2_endianness_media"
    t.string   "audio2_wrapping_media"
    t.string   "audio2_duration_media"
    t.string   "audio2_bit_rate_mode_media"
    t.string   "audio2_bit_rate_media"
    t.string   "audio2_channel_media"
    t.string   "audio2_sampling_rate_media"
    t.string   "audio2_bit_depth_media"
    t.string   "audio2_streaming_size_media"
    t.string   "audio3_id_media"
    t.string   "audio3_format_media"
    t.string   "audio3_endianness_media"
    t.string   "audio3_wrapping_media"
    t.string   "audio3_duration_media"
    t.string   "audio3_bit_rate_mode_media"
    t.string   "audio3_bit_rate_media"
    t.string   "audio3_channel_media"
    t.string   "audio3_sampling_rate_media"
    t.string   "audio3_bit_depth_media"
    t.string   "audio3_streaming_size_media"
    t.string   "audio4_id_media"
    t.string   "audio4_format_media"
    t.string   "audio4_endianness_media"
    t.string   "audio4_wrapping_media"
    t.string   "audio4_duration_media"
    t.string   "audio4_bit_rate_mode_media"
    t.string   "audio4_bit_rate_media"
    t.string   "audio4_channel_media"
    t.string   "audio4_sampling_rate_media"
    t.string   "audio4_bit_depth_media"
    t.string   "audio4_streaming_size_media"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workflows", force: :cascade do |t|
    t.string   "title"
    t.string   "kind"
    t.boolean  "active"
    t.string   "storage_folder"
    t.integer  "db_folder"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
