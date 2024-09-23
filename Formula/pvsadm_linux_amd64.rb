class PvsadmLinuxAmd64 < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.11/pvsadm-linux-amd64.tar.gz"
  version "0.1.11"
  sha256 "0ece0d5674770af26fab167f3c63e8dc49c8947bef15cd745a4e45b4c255932c"
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
