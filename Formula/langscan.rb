class Langscan < Formula
  desc "Scan installed programming languages"
  homepage "https://github.com/Zakka163/homebrew-langscan"
  version "0.5.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.5.0/langscan-macos-amd64"
      sha256 "c433a6b1c98472eb8735cf8284b539b5be00e4621b134213836e0afc8f4c8e85"
    elsif Hardware::CPU.arm?
      url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.5.0/langscan-macos-arm64"
      sha256 "8719d3b998ac2ac1f762a3335f57b63ef88fb01465cd9e93769f47982daaa3e8"
    end
  elsif OS.linux?
    url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.5.0/langscan-linux-amd64"
    sha256 "389a8faf2db43a23a19017defc605d2b3675661b362f618455036a60c9cf9718"
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "langscan-macos-amd64" => "langscan"
      elsif Hardware::CPU.arm?
        bin.install "langscan-macos-arm64" => "langscan"
      end
    elsif OS.linux?
      bin.install "langscan-linux-amd64" => "langscan"
    end
  end

  test do
    system "#{bin}/langscan", "--v"
  end
end
