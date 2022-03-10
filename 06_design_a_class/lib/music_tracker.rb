class MusicTracker
  def initialize(name)
    @name = name
    @track_list = []
  end

  def add(track)
    fail "No track specified" if track.empty?
    @track_list.push(track)
  end

  def track_list
    fail "No songs on tracklist" if @track_list.empty?
    @track_list
  end
end