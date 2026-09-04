class Kickoff < Formula
  desc "Football fixtures from multiple sources, queryable through a CLI and AI agents"
  homepage "https://github.com/atillalab/kickoff"
  url "https://github.com/atillalab/kickoff/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6b6efc2e435906fdecfc4b475db788e4ef9d9369ffcd239dd509a831b75c6a57"
  license "MIT"

  depends_on "go" => :build

  def install
    # NOTE: v0.1.0 declares Version as a const, so -ldflags -X cannot stamp
    # it (linker rejects non-var symbols). Later releases declare it as a
    # var; when the formula is bumped past v0.1.0, switch to:
    #   ldflags = "-s -w -X main.Version=#{version}"
    #   system "go", "build", *std_go_args(output: bin/"kickoff", ldflags: ldflags), "./cmd/kickoff"
    system "go", "build", *std_go_args(output: bin/"kickoff"), "./cmd/kickoff"
  end

  test do
    # v0.1.0 --version reports the unstamped dev placeholder (see above).
    assert_match "kickoff", shell_output("#{bin}/kickoff --version")
    assert_match "premier-league", shell_output("#{bin}/kickoff leagues")
  end
end
