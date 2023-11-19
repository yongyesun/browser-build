#!/bin/sh
sudo apt-get update
sudo apt-get install -y ccache
mkdir -p $HOME/.ccache/
mkdir -p "$ROOT/cache"
mkdir -p "$ROOT/debug"
echo 'compiler_check = none' >> $HOME/.ccache/ccache.conf
#echo "stats = false" >> $HOME/.ccache/ccache.conf
echo 'max_size = 20G' >> $HOME/.ccache/ccache.conf
echo "base_dir = $HOME" >> $HOME/.ccache/ccache.conf
echo "cache_dir = $ROOT/cache" >> $HOME/.ccache/ccache.conf
echo "hash_dir = false" >> $HOME/.ccache/ccache.conf
#echo "sloppiness = include_file_mtime" >> $HOME/.ccache/ccache.conf
#echo "sloppiness = time_macros" >> $HOME/.ccache/ccache.conf
echo "debug = true" >> $HOME/.ccache/ccache.conf
#echo "debug_dir = $ROOT/debug" >> $HOME/.ccache/ccache.conf
#export CCACHE_DEBUGDIR=$ROOT/debug
#git clone --depth=1 https://github.com/AoEiuV020/chromium-ccache-arm64.git $ROOT/cache
ls -a $HOME/.ccache && cat $HOME/.ccache/ccache.conf
ls -lh $ROOT
