class GinCli < Formula
  desc "Command line client for the G-Node Infrastructure (GIN) services"
  homepage "https://web.gin.g-node.org/G-Node/Info/wiki/GinCliSetup"
  url "https://github.com/G-Node/gin-cli/releases/download/v1.9/gin-cli-1.9-macos-amd64.tar.gz"
  sha256 "5ff7c9d87739f9e556d864120577631333cc8e0656c2b8b0c7744310cabd7f5c"
  head "https://github.com/G-Node/gin-cli.git"

  bottle :unneeded

  depends_on "git-annex"

  def install
    bin.install "gin"
  end

end
