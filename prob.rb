class Prob < Formula
  desc "The ProB Animator and Model Checker"
  homepage "https://www3.hhu.de/stups/prob/index.php/Main_Page"

  url "https://www3.hhu.de/stups/downloads/prob/tcltk/releases/1.7.1/ProB.mac_os.x86_64.tar.gz"
  version "1.7.1"
  sha256 "f78683fb6db33e8607e7d92a8ef9084c537c19fa8349138236f0e392b1e3b4be"

  bottle :unneeded

  conflicts_with "prob-nightly", :because => "Same thing, but older"

  depends_on :arch => :x86_64
  depends_on :macos => :yosemite

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/probcli.sh"]
    mv "#{bin}/probcli.sh", "#{bin}/probcli"

    bin.write_exec_script Dir["#{libexec}/StartProb.sh"]
    mv "#{bin}/StartProb.sh", "#{bin}/prob-tk"
  end

  def caveats; <<~EOS
    Depends on:
    Tcl/TK 8.5
    Java Runtime Environment or better Java JDK (7.0 or newer)
  EOS
  end

  test do
    system "probcli"
    system "prob-tk"
  end
end
