{ stdenv, fetchzip, pkgconfig, ffmpeg, gtk2-x11, libjpeg }:

stdenv.mkDerivation rec {
  pname = "droidcam";
  version = "0";

  src = fetchzip {
    url = "https://github.com/aramg/droidcam/archive/ab8992d2a3ab774d887b7f9f5959d49340b39ce7.zip";
    sha256 = "1cdaafpffg7266r441ivw1m105wj25saq13s3cb4brwjxg0mm798";
  };

  sourceRoot = "source/linux";

  buildInputs = [ pkgconfig ];
  nativeBuildInputs = [ ffmpeg gtk2-x11 libjpeg ];

  postPatch = ''
    sed -i -e 's:/opt/libjpeg-turbo/include:${libjpeg.out}/include:' Makefile
    sed -i -e 's:/opt/libjpeg-turbo/lib`getconf LONG_BIT`/libturbojpeg.a:${libjpeg.out}/lib/libturbojpeg.so:' Makefile
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp droidcam droidcam-cli $out/bin/
  '';

  meta = with stdenv.lib; {
    description = "DroidCam Linux client";
    homepage = https://github.com/aramg/droidcam;
  };
}
