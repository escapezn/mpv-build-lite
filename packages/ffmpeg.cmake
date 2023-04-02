ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        avisynth-headers
        nvcodec-headers
        bzip2
        gmp
        lame
        libass
        libbluray
        libpng
        libsoxr
        libbs2b
        libzimg
        libmysofa
        opus
        speex
        x264
        libxml2
        libvpl
        shaderc
        libplacebo
        libzvbi
        libaribcaption
        dav1d
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --target-exec=wine
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-gpl
        --enable-version3
        --enable-nonfree
        --enable-postproc
        --enable-avisynth
        --enable-gmp
        --enable-libass
        --enable-libbluray
        --enable-libfreetype
        --enable-libfribidi
        --enable-libmp3lame
        --enable-libopus
        --enable-libsoxr
        --enable-libspeex
        --enable-libbs2b
        --enable-libx264
        --enable-libdav1d
        --enable-libzimg
        --disable-mbedtls
        --enable-schannel
        --enable-libxml2
        --enable-libmysofa
        --disable-libssh
        --disable-libsrt
        --enable-libvpl
        --enable-libplacebo
        --enable-libshaderc
        --enable-libzvbi
        --enable-libaribcaption
        --enable-cuda
        --enable-cuvid
        --enable-nvdec
        --enable-nvenc
        --enable-amf
        --disable-doc
        --disable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-ffplay
        --disable-ffprobe
        --disable-encoder=opus
        --disable-encoder=libspeex
        "--extra-libs='-lsecurity -lschannel -lstdc++'" # needs by libjxl and shaderc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
