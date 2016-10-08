# Why

SSH in macOS Sierra doesn't stop version 1. The homebrew tap doesn't support it by default either.

# Usage
```shell
brew tap homebrew/dupes
curl -fsSL https://github.com/boltomli/MyMacScripts/raw/master/homebrew/homebrew-dupes.openssh.diff | patch /usr/local/Homebrew/Library/Taps/homebrew/homebrew-dupes/openssh.rb
brew install openssh --with-ssh1
```
