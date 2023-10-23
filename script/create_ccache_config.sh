#!/bin/sh
mkdir -p $ROOT/.ccache/
echo 'compiler_check = none' >> $ROOT/.ccache/ccache.conf
echo "stats = false" >> $ROOT/.ccache/ccache.conf
echo 'max_size = 20G' >> $ROOT/.ccache/ccache.conf
echo "base_dir = $ROOT" >> $ROOT/.ccache/ccache.conf
echo "cache_dir = $ROOT/cache" >> $ROOT/.ccache/ccache.conf
echo "hash_dir = false" >> $ROOT/.ccache/ccache.conf
