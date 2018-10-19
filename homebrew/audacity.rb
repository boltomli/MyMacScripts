cask 'audacity' do
  version '2.3.0'
  sha256 '16684a03a6e6aacac0962636735ce7d9bf11483f6d194b05729981136cced9eb'
  url do
    # Audacity does not provide a fixed URL
    # Their download URL points to a html page that post a request through js
    # fosshub.com/Audacity.html was verified as official when first introduced to the cask
    require 'net/https'
    params = {}
    params["projectId"] = '5b7eee97e8058c20a7bbfcf4'
    params["releaseId"] = '5bb1fc583019e925782edd0d'
    params["projectUri"] = 'Audacity.html'
    params["fileName"] = "audacity-macos-#{version}.dmg"
    params["isLatestVersion"] = 'true'
    uri = URI.parse("https://api.fosshub.com/download/")
    res = Net::HTTP.post_form(uri, params)
    require 'json'
    JSON.parse(res.body)['data']['url'].to_s
  end
  name 'Audacity'
  homepage 'http://www.audacityteam.org/'

  depends_on macos: '>= :lion'

  app 'Audacity.app'

  zap delete: '~/Library/Application Support/audacity'
end
