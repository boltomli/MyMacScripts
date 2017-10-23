# Tasks for Homebrew

## Update brew periodically

The task will run each hour when user is logged in.

```shell
mkdir -p $HOME/Library/LaunchAgents
cp sh.brew.plist $HOME/Library/LaunchAgents
```

## Enable ssh version 1 support in macOS Sierra

### Why

SSH in macOS Sierra dropped version 1 support. The homebrew tap doesn't support it by default either. It is not encouraged to do so in fact, as we have to stay at version 7.5 which would be insecure.

### Usage

```shell
curl -fsSL https://github.com/boltomli/MyMacScripts/raw/master/homebrew/homebrew-core.openssh.diff | patch $(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/openssh.rb
brew install openssh --with-ssh1
```

If you want to make ssh1 work in Applications such as Welly ***DANGEROUS!***:

```shell
brew cask install welly
sudo ln -s /usr/local/bin/ssh /usr/local/s
LC_ALL=C sed -i.bak 's#/usr/bin/ssh#/usr/local/s#' /Applications/Welly.app/Contents/MacOS/Welly
```

[clyang-welly](https://github.com/clyang/welly) is in active development so you may want to try `brew cask install clyang-welly`

## Audacity

Audacity was removed from official cask room but is apparently still useful. I'll keep a copy updated with upstream version (`2.1.3` at present).

```shell
brew cask install https://github.com/boltomli/MyMacScripts/raw/master/homebrew/audacity.rb
```

## proxychains-ng

If proxychains4 pops warning

```text
dyld: warning: could not load inserted library '/usr/local/Cellar/proxychains-ng/4.12_1/lib/libproxychains4.dylib' into library validated process because no suitable image found.  Did find:
    /usr/local/Cellar/proxychains-ng/4.12_1/lib/libproxychains4.dylib: code signing blocked mmap() of '/usr/local/Cellar/proxychains-ng/4.12_1/lib/libproxychains4.dylib'
```

Simply use a different binary after proxychains4 that is not in System default paths such as /Applications, etc. For exapmle, `proxychains4 /usr/local/bin/wget [someurl]`.
