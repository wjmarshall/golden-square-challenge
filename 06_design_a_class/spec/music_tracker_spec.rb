require 'music_tracker'

RSpec.describe MusicTracker do
  subject(:new_tracklist) { MusicTracker.new("Playlist_1") }
  it "adds a track to our tracklist" do
    new_tracklist.add("Road to nowhere")
    expect(new_tracklist.track_list).to eq ["Road to nowhere"]
  end

  it "throws an error when no track is specified" do
    expect { new_tracklist.add("") }.to raise_error "No track specified"
  end

  it "adds multiple tracks to our playlist" do
    new_tracklist.add("Road to nowhere")
    new_tracklist.add("Move on up")
    expect(new_tracklist.track_list).to eq ["Road to nowhere", "Move on up"]
  end

  it "throws an error when the tracklist is empty" do
    expect { new_tracklist.track_list }.to raise_error "No songs on tracklist"
  end
end