class NixioStatic < Formula
  desc "C++ static library for the NIX scientific data format and model"
  homepage "http://www.g-node.org/nix"
  url "https://github.com/G-Node/nix/archive/1.4.4.tar.gz"
  sha256 "9f69b18ad763aa1e1e6fb61fcec40e010d9fb48c22d1802ecb014546994e0f0d"
  head "https://github.com/G-Node/nix.git"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "cppunit"
  depends_on "hdf5"

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

  # test do
  #  resource("demofile").stage do
  #    system bin/"nix-tool", "dump", "spike_features.h5"
  #  end
  # end
end
