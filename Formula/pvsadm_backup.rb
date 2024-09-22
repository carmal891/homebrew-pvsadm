class PvsadmBackup < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.17"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.11/pvsadm-darwin-amd64.tar.gz"
      sha256 "7af9d26b61a032f874be6d5a040b762796651bfde1acf95188b23ad85de1a646"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.11/pvsadm-darwin-arm64.tar.gz"
      sha256 "053068fbfe6b6ea83fe285a22e0c260651714a976aee3d2c2be6529f2fbfc5f3"
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
