class Langscan < Formula
  desc "Scan installed programming languages"
  homepage "https://github.com/Zakka163/homebrew-langscan"
  version "0.4.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.4.3/langscan-macos-amd64"
      sha256 "fb37b7d5466c797bf7c8255ffbff62f0d9572c8c0e6eb3fd89271bf18dcf3fe0"
    elsif Hardware::CPU.arm?
      url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.4.3/langscan-macos-arm64"
      sha256 "fb37b7d5466c797bf7c8255ffbff62f0d9572c8c0e6eb3fd89271bf18dcf3fe0"
    end
  elsif OS.linux?
    url "https://github.com/Zakka163/homebrew-langscan/releases/download/v0.4.3/langscan-linux-amd64"
    sha256 "fb37b7d5466c797bf7c8255ffbff62f0d9572c8c0e6eb3fd89271bf18dcf3fe0"
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
