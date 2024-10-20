class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.18"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.18/pvsadm-darwin-amd64.tar.gz"
      sha256 "645d9c23029dca498cfafe8ca406432172bce3c7c1eedeb16a9f2615fcbb1a74"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.18/pvsadm-darwin-arm64.tar.gz"
      sha256 "648da9edbdd2b349511641adf8b9406cd0d6b966756a63f2bb0a77d4d49002ab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.18/pvsadm-linux-amd64.tar.gz"
      sha256 "5e9a59b8d892cbb4b34f87bed41ddf767f8dc86026c6f905d3e323bb16ee0cf8"
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
