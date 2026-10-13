class Macdnsview < Formula
  desc "Look up DNS records for many domains and IP addresses at once"
  homepage "https://github.com/ebudist/macdnsview"
  url "https://github.com/ebudist/macdnsview/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8459a0ea48b5828e4c6cc4f94e45f0df9076bf98d49b212b900143734db20d34"
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
