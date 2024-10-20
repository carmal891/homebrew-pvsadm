class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.14"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.14/pvsadm-darwin-amd64.tar.gz"
      sha256 "7a5aa59d0815dc407f42436d53b787697bad5fe97c28e01bd853cfb2df449048"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.14/pvsadm-darwin-arm64.tar.gz"
      sha256 "3870f1e265f1a752e56766f66251fae4aa0f03133be285d709ba1d81a3a4c652"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.14/pvsadm-linux-amd64.tar.gz"
      sha256 "89336b27c90afcbc34ede1c122e817c2e67f638f6bd218e757ed5bc39b08cf38"
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
