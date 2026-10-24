class Macdnsview < Formula
  desc "Look up DNS records for many domains and IP addresses at once"
  homepage "https://github.com/ebudist/macdnsview"
  url "https://github.com/ebudist/macdnsview/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "e49f30d9082b19fdefedccaa5633bd34a2e8d617854fc8eb4f5965bc4dc0ed7b"
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
