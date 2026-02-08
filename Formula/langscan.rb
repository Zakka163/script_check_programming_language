class Langscan < Formula
  desc "Scan installed programming languages"
  homepage "https://github.com/Zakka163/script_check_programming_language"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/Zakka163/script_check_programming_language/releases/download/v0.1.0/langscan-macos-amd64"
      sha256 "64090c35b0649ae73787fbea159fc86ba033769a92f80ccbc8d2369699da0d71"
    elsif Hardware::CPU.arm?
      url "https://github.com/Zakka163/script_check_programming_language/releases/download/v0.1.0/langscan-macos-arm64"
      sha256 "64090c35b0649ae73787fbea159fc86ba033769a92f80ccbc8d2369699da0d71"
    end
  elsif OS.linux?
    url "https://github.com/Zakka163/script_check_programming_language/releases/download/v0.1.0/langscan-linux-amd64"
    sha256 "1cf4a54700dd4db23bdb3eb06f73ceaf4e03827e3a34d49db2b394bfb7f20671"
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
