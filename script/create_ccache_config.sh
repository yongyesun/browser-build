#!/bin/sh
mkdir -p $ROOT/.ccache/
echo 'compiler_check = none' >> $ROOT/.ccache/ccache.conf
echo "stats = false" >> $ROOT/.ccache/ccache.conf
echo 'max_size = 20G' >> $ROOT/.ccache/ccache.conf
echo "base_dir = $ROOT" >> $ROOT/.ccache/ccache.conf
echo "cache_dir = $ROOT/ccache" >> $ROOT/.ccache/ccache.conf
echo "hash_dir = false" >> $ROOT/.ccache/ccache.conf
#git clone --depth=1 https://github.com/AoEiuV020/chromium-ccache-arm64.git $ROOT/ccache
mkdir -p $ROOT/ccache/
