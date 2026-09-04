class Kickoff < Formula
  desc "Football fixtures from multiple sources, queryable through a CLI and AI agents"
  homepage "https://github.com/atillalab/kickoff"
  url "https://github.com/atillalab/kickoff/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dc0af9c2add74530718970c78843dacd3691fd2f6a8e2d5e95321bb30e1106ca"
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
