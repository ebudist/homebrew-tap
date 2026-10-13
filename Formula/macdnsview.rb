class Macdnsview < Formula
  desc "Look up DNS records for many domains and IP addresses at once"
  homepage "https://github.com/ebudist/macdnsview"
  url "https://github.com/ebudist/macdnsview/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ab5d4b926a86707a76c7006e6f7b0ed91cd8e480f133be6fd3a8433cd92d3204"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "scripts/bundle.sh", "--host", "--disable-sandbox"
    bin.install "dist/macdnsview"
    prefix.install "dist/MacDNSView.app"
  end

  def caveats
    <<~EOS
      To open MacDNSView from Launchpad and Spotlight, link it into Applications:
        ln -sf #{opt_prefix}/MacDNSView.app /Applications/MacDNSView.app
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/macdnsview --version")
  end
end
