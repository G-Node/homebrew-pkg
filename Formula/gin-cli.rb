class GinCli < Formula
  desc "Command line client for the G-Node Infrastructure (GIN) services"
  homepage "https://web.gin.g-node.org/G-Node/Info/wiki/GinCliSetup"
  url "https://github.com/G-Node/gin-cli/releases/download/v1.8/gin-cli-1.8-macos-amd64.tar.gz"
  sha256 "205390c6caa282de01dcaa14d999c2f534f1f209ec0c68bbdc31a005ddf4f39c"
  head "https://github.com/G-Node/gin-cli.git"

  bottle :unneeded

  depends_on "git-annex"

  def install
    bin.install "gin"
  end

end
