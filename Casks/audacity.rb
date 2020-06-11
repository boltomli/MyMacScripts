cask 'audacity' do
  version '2.4.1'
  sha256 '5d340b025b80eb0c3ea41ae2487a77b86527bc8fb0e058d32e37762ac3d85575'
  url do
    # Audacity does not provide a fixed URL
    # Their download URL points to a html page that post a request through js
    # fosshub.com/Audacity.html was verified as official when first introduced to the cask
    require 'net/https'
    params = {}
    params["projectId"] = '5b7eee97e8058c20a7bbfcf4'
    params["releaseId"] = '5ec64795191c681deac91d5d'
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
