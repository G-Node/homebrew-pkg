class GinCli < Formula
  desc "Command line client for the G-Node Infrastructure (GIN) services"
  homepage "https://gin.g-node.org/G-Node/Info/wiki/GinCliSetup"
  url "https://github.com/G-Node/gin-cli/releases/download/v1.12/gin-cli-1.12-macos.tar.gz"
  sha256 "0d93efb3fca8bfe93e33fcb0422a6aa47bab7e89c897cb7f9453c84fb398b338"
  head "https://github.com/G-Node/gin-cli.git"
  version "1.12"
  version_scheme 1

  bottle :unneeded

  depends_on "git-annex"

  def install
    bin.install "gin"
  end

end
