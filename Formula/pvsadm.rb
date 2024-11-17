class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.17"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.17/pvsadm-darwin-amd64.tar.gz"
      sha256 "74407ab1f80581e4228f5132c956c334afbceee8cb9833f25800fe2bfa661cdc"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.17/pvsadm-darwin-arm64.tar.gz"
      sha256 "d185168293ad62b27e20f5c3af8402ce5694705e3f79fee5c1ece5fa4f316a9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.17/pvsadm-linux-amd64.tar.gz"
      sha256 "0ece0d5674770af26fab167f3c63e8dc49c8947bef15cd745a4e45b4c255932c"
    end
  end

  def install
    bin.install "pvsadm"
  end

  test do
    output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
    assert_match "Error: --instance-name or --instance-name required", output
    assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version |  awk '{print $1, $2}'")
  end
end
