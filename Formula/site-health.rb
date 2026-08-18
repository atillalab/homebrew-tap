class SiteHealth < Formula
  desc "Fast CLI for checking website and domain health"
  homepage "https://github.com/atillalab/site-health"
  url "https://github.com/atillalab/site-health/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "6a34a04d8149db86f7ef643a8158ac2462493d1ba55e271e04cee13607d91f1b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"site-health"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/site-health --version")
  end
end
