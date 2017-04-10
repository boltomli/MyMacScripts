# Tasks for Homebrew

## Update brew periodically

The task will run each hour when user is logged in.

```shell
mkdir -p $HOME/Library/LaunchAgents
cp sh.brew.plist $HOME/Library/LaunchAgents
```

## Enable ssh version 1 support in macOS Sierra

### Why

SSH in macOS Sierra dropped version 1 support. The homebrew tap doesn't support it by default either.

### Usage

```shell
curl -fsSL https://github.com/boltomli/MyMacScripts/raw/master/homebrew/homebrew-core.openssh.diff | patch /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/openssh.rb
brew install openssh --with-ssh1
```

If you want to make ssh1 work in Applications such as Welly ***DANGEROUS!***:

```shell
brew cask install welly
sudo ln -s /usr/local/bin/ssh /usr/local/s
LC_ALL=C sed -i.bak 's#/usr/bin/ssh#/usr/local/s#' /Applications/Welly.app/Contents/MacOS/Welly
```

## Audacity

Audacity was removed from official cask room but is apparently still useful. I'll keep a copy updated with upstream version (`2.1.3` at present).

```shell
wget -O /usr/local/Homebrew/Library/Taps/caskroom/homebrew-cask/Casks/audacity.rb https://github.com/boltomli/MyMacScripts/raw/master/homebrew/audacity.rb
brew cask install audacity
```
