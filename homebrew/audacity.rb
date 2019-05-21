cask 'audacity' do
  version '2.3.2'
  sha256 '0d2ea6de4f2cbd960abb6a6e020b51f6637423c072422596691960fcfae67206'
  url do
    # Audacity does not provide a fixed URL
    # Their download URL points to a html page that post a request through js
    # fosshub.com/Audacity.html was verified as official when first introduced to the cask
    require 'net/https'
    params = {}
    params["projectId"] = '5b7eee97e8058c20a7bbfcf4'
    params["releaseId"] = '5cd977044525770a47e45e5d'
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
