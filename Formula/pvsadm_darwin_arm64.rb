class PvsadmDarwinArm64 < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.17/pvsadm-darwin-arm64.tar.gz"
  version "0.1.17"
  sha256 "d185168293ad62b27e20f5c3af8402ce5694705e3f79fee5c1ece5fa4f316a9b"
  license "Apache-2.0"

  def install
    bin.install "pvsadm"
  end

  test do
    output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
    assert_match "Error: --instance-name or --instance-name required", output
    assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version | awk '{print $1, $2}'")
  end
end
