cask 'audacity' do
  version '2.1.3'
  sha256 '68e82a944a9aa29068e2a2faa4cbd85f909d48f3916e6a57983d14f605d88b5d'

  url do
    # Audacity does not provide a fixed URL
    # Their download URL points to a html page that generates a temporary URL embedded within an iframe
    # 'open-uri' is required to open that page and grab the temporary URL
    require 'open-uri'
    # fosshub.com/Audacity.html was verified as official when first introduced to the cask
    open("https://www.fosshub.com/Audacity.html/audacity-macos-#{version}.dmg") do |io|
      content = io.read
      %r{^\<iframe.*src=\"(http.*\.dmg)\".*>}.match(content)[1].to_s
    end
  end
  name 'Audacity'
  homepage 'http://www.audacityteam.org/'

  depends_on macos: '>= :snow_leopard'

  app 'Audacity.app'

  zap delete: '~/Library/Application Support/audacity'
end
