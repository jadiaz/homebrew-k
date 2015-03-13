require "formula"

class Kvm < Formula
  homepage "https://www.github.com/aspnet/Home"
  version "1.0.0-beta3"
  url "https://github.com/aspnet/Home.git", :tag => 'v1.0.0-beta3'

  depends_on "mono" => :recommended

  def install
    chmod 0755, "kvminstall.sh"
    system './kvminstall.sh'
    system 'source kvm.sh; kvm upgrade'
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bash_profile, ~/.bashrc or ~/.zshrc file:

      source kvm.sh

    EOS
  end

end
