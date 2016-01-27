class Nix < Formula
  desc "C++ library for the NIX scientific data format and model"
  homepage "http://www.g-node.org/nix"
  url "https://github.com/G-Node/nix/archive/1.1.0.tar.gz"
  sha256 "d607d96117621e5cc563002c4c161913d95db36eeb7c4e6f51afca5f6b788fcc"

  head "https://github.com/G-Node/nix.git"

  option "without-test", "Skip compile-time tests (not recommended)"

  depends_on "cmake" => :build
  depends_on "boost" => "c++11"
  depends_on "homebrew/science/hdf5"
  depends_on "cppunit"

  needs :cxx11

  def install
    ENV.cxx11

    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_TESTING=OFF"

    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "test" if build.with? "test"
    system "make", "install"
  end

  test do
    system bin/"nix-tool", "--help"
  end
end
