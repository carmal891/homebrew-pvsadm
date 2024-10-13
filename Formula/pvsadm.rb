class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.9"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.9/pvsadm-darwin-amd64.tar.gz"
      sha256 "626dfcf0049c914a8651dde8178758ac79d4dd52675e38b34017caa1ac9023d5"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.9/pvsadm-darwin-arm64.tar.gz"
      sha256 "997ae10c45d16ba2c56f04896b2bf16367ad34a65fbf3cf385aff5f9b7a0dfa4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.9/pvsadm-linux-amd64.tar.gz"
      sha256 "cdb7c89d1d83f67ff411116f530bcebdd1797b14f09af93cdff0a770df035ece"
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
