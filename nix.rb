class Nix < Formula
  desc "C++ library for the NIX scientific data format and model"
  homepage "http://www.g-node.org/nix"
  url "https://github.com/G-Node/nix/archive/1.1.0.tar.gz"
  sha256 "d607d96117621e5cc563002c4c161913d95db36eeb7c4e6f51afca5f6b788fcc"

  head "https://github.com/G-Node/nix.git"

  depends_on "cmake" => :build
  depends_on "homebrew/science/hdf5"
  depends_on "cppunit"

  if OS.mac? && MacOS.version < :mavericks
    depends_on "boost" => "c++11"
  else
    depends_on "boost"
  end

  needs :cxx11

  def install
    ENV.cxx11

    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "test"
    system "make", "install"
  end

  test do
    system bin/"nix-tool", "--help"
  end
end
