cask "pqsign" do
  version "0.3.1"

  on_macos do
    on_arm do
      sha256 "28c8f49a950889e1bb38dd73f33543c2615adbbf4123b35523e6b6c571367a3f"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "c2c27ba2b082852199eb6ada56bebb7e859646a2d98f6ebabbaa2536799ac667"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-x86_64-apple-darwin.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b874b47cac1d15bcd2737ce0688daa0a71c9ac6799accf30e6bf7eb3cdabe29e"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "74b78cf23d4e1840f10e44882d0f049af2d49b928a1a9240ad079fcf921d5ace"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  name "pqsign"
  desc "Hybrid post-quantum file signing with Ed25519 and ML-DSA-65"
  homepage "https://github.com/pscheid92/pqsign"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "pqsign"
  generate_completions_from_executable "pqsign", "completions"

  # The release binaries are not notarized, so Gatekeeper would block the quarantined download.
  preflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/pqsign"]
    end
  end

  zap :not_required
end
