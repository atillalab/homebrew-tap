class Kickoff < Formula
  desc "Football fixtures from multiple sources, queryable through a CLI and AI agents"
  homepage "https://github.com/atillalab/kickoff"
  url "https://github.com/atillalab/kickoff/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2666c8dc3bea4957a8a2c38fbe24c7cef681d503bb870bcaa7e3f4dbcf730ebd"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.Version=#{version}"
    system "go", "build", *std_go_args(output: bin/"kickoff", ldflags: ldflags), "./cmd/kickoff"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kickoff --version")
    assert_match "super-lig", shell_output("#{bin}/kickoff leagues")
  end
end
