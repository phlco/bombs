# describe "Example page", :type => :request do
#   it "contains an H1 with text 'Hello World!'" do
#     visit '/index.html'
#     expect(page).to have_css 'h1', :text => 'Hello World!'
#   end
# end

### Part One

# 1. The user should be able to load up a page that displays a series of wires.
# They should see instructions - what do they need to do in order to defuse the bomb?
# - The user should be able to click on a wire to "cut" it in an attempt to defuse the bomb.
# When clicked, the wire should appear to have been cut so that the user knows they've clicked it.
# - If the user clicks the correct wire, they should be informed that they have successfully defused the bomb.
# - If the user clicks the incorrect wire, they should be informed that they have failed.
# - If the user wins or loses the game, they shouldn't be able to click any more wires...


describe "Part 1", js: true do
  describe "clicking a wire" do
    it "cuts wire" do
      visit "/index.html"
      wire = all('.wire').first
      wire.click
      expect(console).to log("cut!")
      expect(wire[:class].include?("cut")).to be true
    end
  end
  describe "clicking the wrong wire" do
    it "blows up" do
      visit "/index.html"
      wire = find("#red")
      wire.click
      expect(console).to log("boom!")
    end
  end
  describe "the correct order" do
    it "doesn't blow up" do
      visit "/index.html"
      red, blue, green = [find("#red"), find("#blue"), find("#green")]
      [green, blue, red].each(&:click)
      expect(console).to_not log("boom!")
    end
  end
end

