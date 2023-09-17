emcc ../wrapper/main.c \
	-I /usr/local/include/ \
	-O1 \
	-c \
	-o main.o

emcc main.o \
	--no-entry \
	-L /usr/local/lib/libarchive.a \
	-Wl,/usr/local/lib/libarchive.a \
	-O1 \
	-s WASM=1 \
	-s EXPORT_ES6=1 \
	-s EXPORTED_FUNCTIONS=@$PWD/lib.exports \
	-s ERROR_ON_UNDEFINED_SYMBOLS=0 \
	-s EXPORTED_RUNTIME_METHODS=ccall,cwrap,intArrayFromString,allocate \
	-s ENVIRONMENT=worker \
	-s EXPORT_NAME=createArchiveModule \
	-s USE_ZLIB=1 \
	-s USE_BZIP2=1 \
	-s MODULARIZE=1 \
	-o ../../src/webworker/wasm-gen/libarchive.js

echo Done
