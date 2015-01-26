module SportsDataApi
  module Golf

    class Exception < ::Exception
    end

    DIR = File.join(File.dirname(__FILE__), 'golf')
    BASE_URL = 'http://api.sportsdatallc.org/golf-%{access_level}%{version}'
    DEFAULT_VERSION = 1
    SPORT = :golf
    DEFAULT_GOLF_TOUR = "pga"
    VALID_TOURS = ["pga"]

    autoload :Season, File.join(DIR, 'season')
    autoload :Tournament, File.join(DIR, 'tournament')
    autoload :Venue, File.join(DIR, 'venue')
    autoload :Course, File.join(DIR, 'course')
    autoload :Hole, File.join(DIR, 'hole')
    # autoload :Player, File.join(DIR, 'player')
    # autoload :TeeTime, File.join(DIR, 'tee_time')
    # autoload :MatchPlayScoring, File.join(DIR, 'match_play_scoring')
    # autoload :MatchPlayLeaderboard, File.join(DIR, 'match_play_leaderboard')
    # autoload :StrokePlayScoring, File.join(DIR, 'stroke_play_scoring')
    # autoload :StrokePlayLeaderboard, File.join(DIR, 'stroke_play_leaderboard')
    # autoload :TournamentHoleStatistics, File.join(DIR, 'tournament_hole_statistics')
    # autoload :PlayerStatistics, File.join(DIR, 'player_statistics')

    ##
    # Fetches golf tournament schedule for a given year and tour
    def self.season(year, golf_tour = DEFAULT_GOLF_TOUR, version = DEFAULT_VERSION)
      tour = golf_tour.to_s.downcase
      raise SportsDataApi::Golf::Exception.new("#{tour} is not a valid tour") unless VALID_TOURS.include?(tour)

      response = self.response_json(version, "/schedule/#{golf_tour}/#{year}/tournaments/schedule.json")

      return Season.new(year: year, season_hash: response)
    end

    def self.response_json(version, url)
      base_url = BASE_URL % { access_level: SportsDataApi.access_level(SPORT), version: version }
      response = SportsDataApi.generic_request("#{base_url}#{url}", SPORT)
      MultiJson.load(response.to_s)
    end
  end
end