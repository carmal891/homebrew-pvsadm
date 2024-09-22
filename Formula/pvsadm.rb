class PvsadmBackup < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  license "Apache-2.0"
  
  if OS.mac?
    if Hardware::CPU.intel?
        require_relative "pvsadm_darwin_amd64"
        PvsadmDarwinAmd64.new
    elsif Hardware::CPU.arm?
        require_relative "pvsadm_darwin_arm64"
        PvsadmDarwinArm64.new
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
       require_relative "pvsadm_linux_amd64"
       PvsadmLinuxAmd64.new
    end
  end
  
  def install
    raise "Unsupported platform" unless defined? @formula
    @formula.install
  end

  test do
    raise "Unsupported platform" unless defined? @formula
    @formula.test
  end
end
  