class PvsadmDarwinAmd64 < Formula
desc "Tool for managing the IBM Power Systems Virtual Servers"
homepage "https://github.com/ppc64le-cloud/pvsadm"
version "0.1.17"
license "Apache-2.0"

url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.17/pvsadm-darwin-amd64.tar.gz"
sha256 "74407ab1f80581e4228f5132c956c334afbceee8cb9833f25800fe2bfa661cdc"

def install
bin.install "pvsadm"
end

test do
  output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
assert_match "Error: --instance-name or --instance-name required", output
assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version | awk '{print $1, $2}'")
end
end