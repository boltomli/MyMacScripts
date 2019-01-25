cask 'foobar2000' do
  version '2.1.27'
  sha256 'b96cc690cd17dc60bb325bbf66110f4c990081d6ef0d1e17387bca3f4047f321'
  url "https://www.foobar2000.org/files/10f355c80cfe611d40aa37f0392580fb/foobar2000-v#{version}.dmg"
  name 'foobar2000'
  homepage 'https://www.foobar2000.org/mac'
  depends_on macos: '>= :mavericks'
  app 'foobar2000.app'
end
