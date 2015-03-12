require "formula"

class Dnvm < Formula
  homepage "https://www.github.com/aspnet/Home"
  version "1.0.0-beta4"
  url "https://github.com/aspnet/Home.git"

  head "https://github.com/aspnet/Home.git", :branch => 'dev'

  depends_on "mono" => :recommended

  def install
    libexec.install "dnvminstall.sh"
    (libexec + "dnvm.sh").chmod 0755
    (libexec + "mono").make_symlink Formula["mono"].opt_bin/"mono"
    system "bash -c 'source #{libexec}/dnvm.sh; dnvm upgrade'"
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bash_profile, ~/.bashrc or ~/.zshrc file:

      source dnvm.sh

    EOS
  end

end
