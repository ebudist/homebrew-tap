class Macdnsview < Formula
  desc "Look up DNS records for many domains and IP addresses at once"
  homepage "https://github.com/ebudist/macdnsview"
  url "https://github.com/ebudist/macdnsview/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "308af33254c98d87da41289dff228216c40e4d1f3ce06d03ee1061ceffe83e00"
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
