module Marjan
  module LastFm
    class Scrobbler
      
      # Length should be in seconds, required when source is 'P'
      # Started playing should be timestamp in the UTC time zone
      Submission = Struct.new(:artist, :track, :started_playing, :source, :length, :rating, :album, :track_number, :music_brainz_id)
      class Submission
        def to_param
          raise ArgumentError, 'Required params: :artist, :track' if artist.nil? || artist.empty? || track.nil? || track.empty?
          raise ArgumentError, ':source can be one of: P, R, L, E' unless ['P', 'R', 'L', 'E'].include?(source)
          raise ArgumentError, ':rating can be one of: L, B, S' unless ['L', 'B', 'S'].include?(rating) || rating.nil? || rating.empty?
          raise ArgumentError, 'Length is required when source is P' if source == 'P' && (length.nil? || length.to_s.empty?)
          
          {
            :a => artist,
            :t => track,
            :i => started_playing,
            :o => source,
            :r => rating,
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