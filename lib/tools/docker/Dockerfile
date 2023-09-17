FROM emscripten/emsdk

WORKDIR /src

ADD https://github.com/libarchive/libarchive/releases/download/v3.7.1/libarchive-3.7.1.zip /src

RUN unzip /src/libarchive-3.7.1.zip && rm /src/libarchive-3.7.1.zip

ENV CPPFLAGS "-I/usr/local/include/"
ENV LDFLAGS "-L/usr/local/lib"

# compile libarchive to LLVM
RUN cd /src/libarchive-3.7.1 && emconfigure ./configure \
  --disable-shared \
  --disable-bsdtar --disable-bsdcat \
  --disable-bsdcpio --disable-posix-regex-lib \
  --enable-bsdunzip=static --disable-largefile \
  --disable-xattr --disable-acl \
  --without-cng \
  --without-nettle --without-lzo2 \
  --without-libb2 --without-zstd \
  --without-openssl \
  --without-xml2 --without-expat
RUN cd /src/libarchive-3.7.1 && emmake make
RUN cd /src/libarchive-3.7.1 && emmake make install


WORKDIR /var/local/lib/tools
CMD ["bash","/var/local/lib/tools/build.sh"]
