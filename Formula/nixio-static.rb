class NixioStatic < Formula
  desc "C++ library for the NIX scientific data format and model --- installation of the static lib"
  homepage "http://www.g-node.org/nix"
  url "https://github.com/G-Node/nix/archive/1.4.2.tar.gz"
  sha256 "dd7a38bd20e0ecb8ebedfec04271daed8280039896d395f5ce8a6402a2433839"
  head "https://github.com/G-Node/nix.git"

  depends_on "cmake" => :build
  depends_on "hdf5"
  depends_on "cppunit"
  depends_on "boost"

  needs :cxx11

  resource "demofile" do
    url "https://raw.githubusercontent.com/G-Node/nix-demo/master/data/spike_features.h5"
    sha256 "b486202df0527545cd53968545d5fb3700567dbf10fbf7d9ca9d9a98fe2998ac"
  end

  def install
    ENV.cxx11

    args = std_cmake_args
    args << "-DBUILD_STATIC=ON"
    system "cmake", ".", *args
    system "make"
    system "make", "test"
    system "make", "install"
  end

  #test do
  #  resource("demofile").stage do
  #    system bin/"nix-tool", "dump", "spike_features.h5"
  #  end
  #end
end
