cask 'wiznote-lite' do
  version '1.0.2'
  sha256 '9a7ad9d5e8a04b61605a0d03c866b2e81290733c011351dbf7ee7f151fc0e808'
  url "http://get.wiz.cn/Lite/WizNote%20Lite-#{version}.dmg"
  name 'WizNote Lite'
  homepage 'https://www.wiz.cn/'
  depends_on macos: '>= :high_sierra'
  app 'WizNote Lite.app'
end
