#/bin/sh
#

rm -rf sqlite3
gcc -o sqlite3 shell.c sqlite3.c compress.c /opt/local/lib/libz.a
mkdir dist
mv sqlite3 dist\
