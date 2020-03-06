class GinCli < Formula
  desc "Command line client for the G-Node Infrastructure (GIN) services"
  homepage "https://gin.g-node.org/G-Node/Info/wiki/GinCliSetup"
  url "https://github.com/G-Node/gin-cli/releases/download/v1.10/gin-cli-1.10-macos.tar.gz"
  sha256 "97b4dff524323cb786c35e7601392674d8e5edc9f322aec87f4880347b0a4625"
  head "https://github.com/G-Node/gin-cli.git"
  version "1.10"
  version_scheme 1

  bottle :unneeded

  depends_on "git-annex"

  def install
    bin.install "gin"
  end

end
