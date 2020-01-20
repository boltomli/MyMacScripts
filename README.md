# MyMacScripts

Random scripts on Mac OS X to handle different tasks I hit.

## R

To support some packages build for openmp, first make sure `gcc` and `llvm` are installed (brew canonical version is OK at the moment), then `mkdir ~/.R && nano ~/.R/Makevars`.

```
CC=/usr/local/opt/llvm/bin/clang
CXX=/usr/local/opt/llvm/bin/clang++
CXX1X=$(CXX)
LDFLAGS=-L/usr/local/opt/llvm/lib
FLIBS=-L/usr/local/Cellar/gcc/9.2.0_1/lib/gcc/9
```

## Homebrew

### Update brew periodically

The task will run each hour when user is logged in.

```shell
mkdir -p ~/Library/LaunchAgents
cp sh.brew.plist ~/Library/LaunchAgents
```

### Enable ssh version 1 support in macOS Sierra and above

SSH in macOS Sierra dropped version 1 support. The homebrew tap doesn't support it by default either. It is not encouraged to do so in fact, as we have to stay at version 7.5 which would be insecure.

```shell
brew tap boltomli/MyMacScripts https://github.com/boltomli/MyMacScripts.git
brew install boltomli/MyMacScripts/openssh --with-ssh1
```

If you want to make ssh1 work in Applications such as Welly ***DANGEROUS!***:

```shell
brew cask install welly
sudo ln -s /usr/local/bin/ssh /usr/local/s
LC_ALL=C sed -i.bak 's#/usr/bin/ssh#/usr/local/s#' /Applications/Welly.app/Contents/MacOS/Welly
```

[clyang-welly](https://github.com/clyang/welly) is the active development in brew now.

### Audacity

Audacity was removed from official cask room but is apparently still useful. I'll keep a copy updated with upstream version.

```shell
brew tap boltomli/MyMacScripts https://github.com/boltomli/MyMacScripts.git
brew cask install audacity
```

## proxychains-ng

If proxychains4 pops warning

```text
dyld: warning: could not load inserted library '/usr/local/Cellar/proxychains-ng/4.12_1/lib/libproxychains4.dylib' into library validated process because no suitable image found.  Did find:
    /usr/local/Cellar/proxychains-ng/4.12_1/lib/libproxychains4.dylib: code signing blocked mmap() of '/usr/local/Cellar/proxychains-ng/4.12_1/lib/libproxychains4.dylib'
```

Simply use a different binary after proxychains4 that is not in System default paths such as /Applications, etc. For exapmle, `proxychains4 /usr/local/bin/wget [someurl]`.

## X11 forwarding

Enable indirect GLX by `defaults write org.macosforge.xquartz.X11 enable_iglx -bool true` then `ssh -Y [host]`.

## Python

`brew install sashkab/python/python@3.X`
