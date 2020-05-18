cask 'audacity' do
  version '2.4.0'
  sha256 '42d08496569556d22f2f22c84b9f0196ef207af1311a9089ebbfcf2af9e21922'
  url do
    # Audacity does not provide a fixed URL
    # Their download URL points to a html page that post a request through js
    # fosshub.com/Audacity.html was verified as official when first introduced to the cask
    require 'net/https'
    params = {}
    params["projectId"] = '5b7eee97e8058c20a7bbfcf4'
    params["releaseId"] = '5ebfc924b441ab1ddec3fb18'
    params["projectUri"] = 'Audacity.html'
    params["fileName"] = "audacity-macos-#{version}.dmg"
    params["source"] = 'CF'
    uri = URI.parse("https://api.fosshub.com/download/")
    res = Net::HTTP.post_form(uri, params)
    require 'json'
    JSON.parse(res.body)['data']['url'].to_s
  end
  name 'Audacity'
  homepage 'http://www.audacityteam.org/'

  depends_on macos: '>= :mavericks'

  app 'Audacity.app'

  zap delete: '~/Library/Application Support/audacity'
end
