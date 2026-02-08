class Langscan < Formula
  desc "Scan installed programming languages"
  homepage "https://github.com/Zakka163/homebrew-langscan"
  version "0.4.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.4.4/langscan-macos-amd64"
      sha256 "33cbe67c0df29febc48278a0642cdcb459fc81d60f309de9c0ce35b6c49c0aff"
    elsif Hardware::CPU.arm?
      url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.4.4/langscan-macos-arm64"
      sha256 "53e95fd61453de052dae5f1e84045a233cfc2ad85db81ddf7f3a0c539f924910"
    end
  elsif OS.linux?
    url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.4.4/langscan-linux-amd64"
    sha256 "a14644f29992bcd9ced95e18a28d5afbbec3ada1ffc03f029788591b36a6c0f4"
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
