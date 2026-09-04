class Kickoff < Formula
  desc "Football fixtures from multiple sources, queryable through a CLI and AI agents"
  homepage "https://github.com/atillalab/kickoff"
  url "https://github.com/atillalab/kickoff/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "e4743b4b8160f8d56fb436bf8894328f546ddced1e95843669a2038ac65ab5e1"
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
