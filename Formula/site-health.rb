class SiteHealth < Formula
  desc "Fast CLI for checking website and domain health"
  homepage "https://github.com/atillalab/site-health"
  url "https://github.com/atillalab/site-health/archive/refs/tags/v0.9.3.tar.gz"
  sha256 "0caa8a297698fd8893d633ff632a4112958923fa6279bb3274c9f47afaee21d7"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"site-health"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/site-health --version")
  end
end
