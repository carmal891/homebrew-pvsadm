class PvsadmDarwinAmd64 < Formula
desc "Tool for managing the IBM Power Systems Virtual Servers"
homepage "https://github.com/ppc64le-cloud/pvsadm"
version "0.1.16"
license "Apache-2.0"

url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.16/pvsadm-darwin-amd64.tar.gz"
sha256 "7af9d26b61a032f874be6d5a040b762796651bfde1acf95188b23ad85de1a646"

def install
bin.install "pvsadm"
end

test do
  output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
assert_match "Error: --instance-name or --instance-name required", output
assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version | awk '{print $1, $2}'")
end
end