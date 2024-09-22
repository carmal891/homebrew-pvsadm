class PvsadmDarwinArm64 < Formula
desc "Tool for managing the IBM Power Systems Virtual Servers"
homepage "https://github.com/ppc64le-cloud/pvsadm"
version "0.1.16"
license "Apache-2.0"

url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.16/pvsadm-darwin-arm64.tar.gz"
sha256 "053068fbfe6b6ea83fe285a22e0c260651714a976aee3d2c2be6529f2fbfc5f3"

def install
bin.install "pvsadm"
end

test do
  output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
assert_match "Error: --instance-name or --instance-name required", output
assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version | awk '{print $1, $2}'")
end
end