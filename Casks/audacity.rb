cask 'audacity' do
  version '2.4.2'
  sha256 '4730abe5b59d9c3dd000fde22d7037af6e6019a4305195a3e4e714f6c9f6380a'
  url do
    # Audacity does not provide a fixed URL
    # Their download URL points to a html page that post a request through js
    # fosshub.com/Audacity.html was verified as official when first introduced to the cask
    require 'net/https'
    params = {}
    params["projectId"] = '5b7eee97e8058c20a7bbfcf4'
    params["releaseId"] = '5ef5ead9c63e265869c6d064'
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

  depends_on macos: '>= :high_sierra'

  app 'Audacity.app'

  zap delete: '~/Library/Application Support/audacity'
end
