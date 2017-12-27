cask 'audacity' do
  version '2.2.1'
  sha256 'a2a850ca956ad8ddf369e5bf251a739e966ebf1d57b19d88bd9a3da9121446fa'

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
