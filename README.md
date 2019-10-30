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
