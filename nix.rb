class Nix < Formula
  desc "C++ library for the NIX scientific data format and model"
  homepage "http://www.g-node.org/nix"
  url "https://github.com/G-Node/nix/archive/1.0.2.tar.gz"
  version "1.0.2"
  sha256 "a8bcff26b2ae447bc7bddcb2826da7ac384891020d22f5da51a58e351e232ba6"

  head "https://github.com/G-Node/nix.git"

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
    system "make", "install"
  end

  test do
    system bin/"nix-tool", "--help"
  end
end
