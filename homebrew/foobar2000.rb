cask 'foobar2000' do
  version '2.1.50'
  sha256 '47b679524ea80aed30ce3505ec3983902c8bb0ce1eb1574c5f9c80bd9dcf4127'
  url "https://www.foobar2000.org/files/17d4961b0f70f340995962a78d428410/foobar2000-v#{version}.dmg"
  name 'foobar2000'
  homepage 'https://www.foobar2000.org/mac'
  depends_on macos: '>= :mavericks'
  app 'foobar2000.app'
end
