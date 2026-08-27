class SiteHealth < Formula
  desc "Fast CLI for checking website and domain health"
  homepage "https://github.com/atillalab/site-health"
  url "https://github.com/atillalab/site-health/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "d9156a62c4e269147063b3063ff21aaf9437addc9269696873a5b3dda9503a55"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"site-health"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/site-health --version")
  end
end
