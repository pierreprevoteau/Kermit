class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.integer :media_id
      t.string :item
      t.string :hash
      t.string :general_format_media
      t.string :general_commercial_name_media
      t.string :general_format_profile_media
      t.string :general_format_settings_media
      t.string :general_file_size_media
      t.string :general_duration_media
      t.string :general_overall_bit_rate_media
      t.string :general_encoded_date_media
      t.string :general_writing_application_media
      t.string :general_writing_library_media
      t.string :video_id_media
      t.string :video_format_media
      t.string :video_commercial_name_media
      t.string :video_format_version_media
      t.string :video_format_profile_media
      t.string :video_bvop_media
      t.string :video_matrix_media
      t.string :video_gop_media
      t.string :video_wrapping_media
      t.string :video_duration_media
      t.string :video_bit_rate_media
      t.string :video_width_media
      t.string :video_height_media
      t.string :video_display_aspect_ratio_media
      t.string :video_frame_rate_media
      t.string :video_color_space_media
      t.string :video_chroma_subsampling_media
      t.string :video_bit_depth_media
      t.string :video_scan_type_media
      t.string :video_compression_mode_media
      t.string :video_ratio_bits_pixel_frame_media
      t.string :video_tc_first_frame_media
      t.string :video_tc_source_media
      t.string :video_stream_size_media
      t.string :audio1_id_media
      t.string :audio1_format_media
      t.string :audio1_endianness_media
      t.string :audio1_wrapping_media
      t.string :audio1_duration_media
      t.string :audio1_bit_rate_mode_media
      t.string :audio1_bit_rate_media
      t.string :audio1_channel_media
      t.string :audio1_sampling_rate_media
      t.string :audio1_bit_depth_media
      t.string :audio1_streaming_size_media
      t.string :audio2_id_media
      t.string :audio2_format_media
      t.string :audio2_endianness_media
      t.string :audio2_wrapping_media
      t.string :audio2_duration_media
      t.string :audio2_bit_rate_mode_media
      t.string :audio2_bit_rate_media
      t.string :audio2_channel_media
      t.string :audio2_sampling_rate_media
      t.string :audio2_bit_depth_media
      t.string :audio2_streaming_size_media
      t.string :audio3_id_media
      t.string :audio3_format_media
      t.string :audio3_endianness_media
      t.string :audio3_wrapping_media
      t.string :audio3_duration_media
      t.string :audio3_bit_rate_mode_media
      t.string :audio3_bit_rate_media
      t.string :audio3_channel_media
      t.string :audio3_sampling_rate_media
      t.string :audio3_bit_depth_media
      t.string :audio3_streaming_size_media
      t.string :audio4_id_media
      t.string :audio4_format_media
      t.string :audio4_endianness_media
      t.string :audio4_wrapping_media
      t.string :audio4_duration_media
      t.string :audio4_bit_rate_mode_media
      t.string :audio4_bit_rate_media
      t.string :audio4_channel_media
      t.string :audio4_sampling_rate_media
      t.string :audio4_bit_depth_media
      t.string :audio4_streaming_size_media

      t.timestamps null: false
    end
  end
end
