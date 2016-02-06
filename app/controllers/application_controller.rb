class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

      def self.get_tmp_path(medium_id)
            #From TMP directory
            tmp_directory = "public/TMP/" + medium_id.to_s + "/"
            return tmp_directory
      end

      def self.get_stg_path(medium_id)
            #From STORAGE directory
            if (1..999999).include?(medium_id)
              first_lvl = "A"
            elsif (1000000..1999999).include?(medium_id)
              first_lvl = "B"
            elsif (2000000..2999999).include?(medium_id)
              first_lvl = "C"
            elsif (3000000..3999999).include?(medium_id)
              first_lvl = "D"
            elsif (4000000..4999999).include?(medium_id)
              first_lvl = "E"
            elsif (5000000..5999999).include?(medium_id)
              first_lvl = "F"
            elsif (6000000..6999999).include?(medium_id)
              first_lvl = "G"
            elsif (7000000..7999999).include?(medium_id)
              first_lvl = "H"
            elsif (8000000..8999999).include?(medium_id)
              first_lvl = "I"
            elsif (9000000..9999999).include?(medium_id)
              first_lvl = "J"
            elsif (10000000..10999999).include?(medium_id)
              first_lvl = "K"
            elsif (11000000..11999999).include?(medium_id)
              first_lvl = "L"
            elsif (12000000..12999999).include?(medium_id)
              first_lvl = "M"
            elsif (13000000..13999999).include?(medium_id)
              first_lvl = "N"
            elsif (14000000..14999999).include?(medium_id)
              first_lvl = "O"
            elsif (15000000..15999999).include?(medium_id)
              first_lvl = "P"
            elsif (16000000..16999999).include?(medium_id)
              first_lvl = "Q"
            elsif (17000000..17999999).include?(medium_id)
              first_lvl = "R"
            elsif (18000000..18999999).include?(medium_id)
              first_lvl = "S"
            elsif (19000000..19999999).include?(medium_id)
              first_lvl = "T"
            elsif (20000000..20999999).include?(medium_id)
              first_lvl = "U"
            elsif (21000000..21999999).include?(medium_id)
              first_lvl = "V"
            elsif (22000000..22999999).include?(medium_id)
              first_lvl = "W"
            elsif (23000000..23999999).include?(medium_id)
              first_lvl = "X"
            elsif (24000000..24999999).include?(medium_id)
              first_lvl = "Y"
            elsif (25000000..25999999).include?(medium_id)
              first_lvl = "Z"
            end

            (0..25999999).step(1000) do |n|
              if ((n-1000)..n).include?(medium_id)
                if n != (medium_id)
                  @second_lvl = n
                end
              end
            end

            stg_directory = "public/STORAGE/" + first_lvl.to_s + "/" + @second_lvl.to_s + "/" + medium_id.to_s + "/"
            return stg_directory
      end

end
