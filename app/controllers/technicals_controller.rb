class TechnicalsController < ApplicationController
  before_action :set_technical, only: [:show, :edit, :update, :destroy]

  # GET /technicals
  # GET /technicals.json
  def index
    @technicals = Technical.all
  end

  # GET /technicals/1
  # GET /technicals/1.json
  def show
  end

  # GET /technicals/new
  def new
    @technical = Technical.new
  end

  # GET /technicals/1/edit
  def edit
  end

  # POST /technicals
  # POST /technicals.json
  def create
    @technical = Technical.new(technical_params)

    respond_to do |format|
      if @technical.save
        format.html { redirect_to @technical, notice: 'Technical was successfully created.' }
        format.json { render :show, status: :created, location: @technical }
      else
        format.html { render :new }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technicals/1
  # PATCH/PUT /technicals/1.json
  def update
    respond_to do |format|
      if @technical.update(technical_params)
        format.html { redirect_to @technical, notice: 'Technical was successfully updated.' }
        format.json { render :show, status: :ok, location: @technical }
      else
        format.html { render :edit }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technicals/1
  # DELETE /technicals/1.json
  def destroy
    @technical.destroy
    respond_to do |format|
      format.html { redirect_to technicals_url, notice: 'Technical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technical
      @technical = Technical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technical_params
      params.require(:technical).permit(:medium_id, :item, :hash, :general_format_media, :general_commercial_name_media, :general_format_profile_media, :general_format_settings_media, :general_file_size_media, :general_duration_media, :general_overall_bit_rate_media, :general_encoded_date_media, :general_writing_application_media, :general_writing_library_media, :video_id_media, :video_format_media, :video_commercial_name_media, :video_format_version_media, :video_format_profile_media, :video_bvop_media, :video_matrix_media, :video_gop_media, :video_wrapping_media, :video_duration_media, :video_bit_rate_media, :video_width_media, :video_height_media, :video_display_aspect_ratio_media, :video_frame_rate_media, :video_color_space_media, :video_chroma_subsampling_media, :video_bit_depth_media, :video_scan_type_media, :video_compression_mode_media, :video_ratio_bits_pixel_frame_media, :video_tc_first_frame_media, :video_tc_source_media, :video_stream_size_media, :audio1_id_media, :audio1_format_media, :audio1_endianness_media, :audio1_wrapping_media, :audio1_duration_media, :audio1_bit_rate_mode_media, :audio1_bit_rate_media, :audio1_channel_media, :audio1_sampling_rate_media, :audio1_bit_depth_media, :audio1_streaming_size_media, :audio2_id_media, :audio2_format_media, :audio2_endianness_media, :audio2_wrapping_media, :audio2_duration_media, :audio2_bit_rate_mode_media, :audio2_bit_rate_media, :audio2_channel_media, :audio2_sampling_rate_media, :audio2_bit_depth_media, :audio2_streaming_size_media, :audio3_id_media, :audio3_format_media, :audio3_endianness_media, :audio3_wrapping_media, :audio3_duration_media, :audio3_bit_rate_mode_media, :audio3_bit_rate_media, :audio3_channel_media, :audio3_sampling_rate_media, :audio3_bit_depth_media, :audio3_streaming_size_media, :audio4_id_media, :audio4_format_media, :audio4_endianness_media, :audio4_wrapping_media, :audio4_duration_media, :audio4_bit_rate_mode_media, :audio4_bit_rate_media, :audio4_channel_media, :audio4_sampling_rate_media, :audio4_bit_depth_media, :audio4_streaming_size_media)
    end
end
