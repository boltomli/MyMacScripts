cask 'foobar2000' do
  version '2.1.55'
  sha256 'c3841ab4fbdb8ab36c60bde3607387cb74311e70070660401183fee47e0cf6f3'
  url "https://www.foobar2000.org/files/514d7a78103d4ae3a4e70f84e4b42c13/foobar2000-v#{version}.dmg"
  name 'foobar2000'
  homepage 'https://www.foobar2000.org/mac'
  depends_on macos: '>= :mavericks'
  app 'foobar2000.app'
end
