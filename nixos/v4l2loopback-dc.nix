{ stdenv, fetchzip, kernel }:

stdenv.mkDerivation rec {
  pname = "v4l2loopback-dc";
  version = "0";

  src = fetchzip {
    url = "https://github.com/aramg/droidcam/archive/ab8992d2a3ab774d887b7f9f5959d49340b39ce7.zip";
    sha256 = "1cdaafpffg7266r441ivw1m105wj25saq13s3cb4brwjxg0mm798";
  };

  sourceRoot = "source/linux/v4l2loopback";

  KVER = "${kernel.modDirVersion}";
  KBUILD_DIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";

  nativeBuildInputs = kernel.moduleBuildDependencies;

  postPatch = ''
    sed -i -e 's:/lib/modules/`uname -r`/build:${KBUILD_DIR}:g' Makefile
  '';

  installPhase = ''
    mkdir -p $out/lib/modules/${KVER}/kernels/media/video
    cp v4l2loopback-dc.ko $out/lib/modules/${KVER}/kernels/media/video/
  '';

  meta = with stdenv.lib; {
    description = "DroidCam kernel module v4l2loopback-dc";
    homepage = https://github.com/aramg/droidcam;
  };
}
