class Howsmyssl < Formula
  desc "The web app running howsmyssl.com"
  homepage "https://www.howsmyssl.com/"

  head "https://github.com/jmhodges/howsmyssl.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/jmhodges/howsmyssl").install Dir["*"]

    cd "src/github.com/jmhodges/howsmyssl" do
      system "go", "build", "-o", "howsmyssl"
      bin.install "howsmyssl"
    end
  end

  test do
    system "#{bin}/howsmyssl", "-h"
  end
end
