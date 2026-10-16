class Macdnsview < Formula
  desc "Look up DNS records for many domains and IP addresses at once"
  homepage "https://github.com/ebudist/macdnsview"
  url "https://github.com/ebudist/macdnsview/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "0bf0cf492c7460790fd72ee9fccab362a5e591feea213aa33ad76dff311f41c0"
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
