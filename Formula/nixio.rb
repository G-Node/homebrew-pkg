class Nixio < Formula
  desc "C++ library for the NIX scientific data format and model"
  homepage "http://www.g-node.org/nix"
  url "https://github.com/G-Node/nix/archive/1.4.3.tar.gz"
  sha256 "83c8e1dca01c59f99a23e02cc4682521ebb7335c4de171a2d78e787dc21268f9"
  head "https://github.com/G-Node/nix.git"

  depends_on "cmake" => :build
  depends_on "hdf5"
  depends_on "cppunit"
  depends_on "boost"

  resource "demofile" do
    url "https://raw.githubusercontent.com/G-Node/nix-demo/master/data/spike_features.h5"
    sha256 "b486202df0527545cd53968545d5fb3700567dbf10fbf7d9ca9d9a98fe2998ac"
  end

  def install
    ENV.cxx11

    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "test"
    system "make", "install"
  end

  test do
    resource("demofile").stage do
      system bin/"nix-tool", "dump", "spike_features.h5"
    end
  end
end
