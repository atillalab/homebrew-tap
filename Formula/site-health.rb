class SiteHealth < Formula
  desc "Fast CLI for checking website and domain health"
  homepage "https://github.com/atillalab/site-health"
  url "https://github.com/atillalab/site-health/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "73ba534e48e8397e5e5116570abec1d604e28677fe2d90ab478450effd9e9dfb"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"site-health"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/site-health --version")
  end
end
