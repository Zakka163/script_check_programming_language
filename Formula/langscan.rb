class Langscan < Formula
  desc "High-performance CLI tool to inventory languages and tools"
  homepage "https://github.com/sakadev/langscan"
  url "https://github.com/sakadev/langscan/releases/download/v0.1.0/langscan-macos-amd64.tar.gz" # UPDATE THIS
  sha256 "SHA256_OF_THE_ARCHIVE" # UPDATE THIS
  license "MIT"

  def install
    bin.install "langscan"
  end

  test do
    system "#{bin}/langscan", "--version"
  end
end
