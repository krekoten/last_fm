module Marjan
  module LastFm
    class Scrobbler
      
      # Length should be in seconds
      
      Notification = Struct.new(:artist, :track, :album, :length, :track_number, :music_brainz_id)
        
      class Notification
        def to_param
          raise ArgumentError, 'Required params: :artist, :track' if artist.nil? || artist.empty? || track.nil? || track.empty?
          
          {
            :a => artist,
            :t => track,
            :b => album || '',
            :l => length || '',
            :n => track_number || '',
            :m => music_brainz_id || ''
          }
        end
      end
    end
  end
end