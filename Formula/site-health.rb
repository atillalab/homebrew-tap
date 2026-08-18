class SiteHealth < Formula
  desc "Fast CLI for checking website and domain health"
  homepage "https://github.com/atillalab/site-health"
  url "https://github.com/atillalab/site-health/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "48e8e55506af59273a2483e6c24aa569355d7ec724841c81e188834d3a81c99f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"site-health"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/site-health --version")
  end
end
