class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.10"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.10/pvsadm-darwin-amd64.tar.gz"
      sha256 "7f13efc579111124d36e06019c612c3e1de7accb44ded0bdaea8caf60f8ad799"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.10/pvsadm-darwin-arm64.tar.gz"
      sha256 "135249849df05c106e8b2faa4074bebb92ea6557e1b143c343a97bd040808315"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.10/pvsadm-linux-amd64.tar.gz"
      sha256 "cee82d4b5179fd04e736b820fc6c41877cf565f382512fce7a2e89762f99e909"
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
