cask "pqsign" do
  version "0.4.0"

  on_macos do
    on_arm do
      sha256 "96695b2fdb3baaf561a12f842d39566a57cd92837810f0e77fa81ed30fa9751d"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "fc1b65e1a6eb884178095cc77c7ce01827ad0d9924d19ef8d43042d6313ff0fd"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-x86_64-apple-darwin.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f74f10a38354ccd62fc35a8c09072e3598d32e88d7af25878f8df57a8a94d8b1"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "13ba62c517f2bffcfb8f5acdf45391c60c88a05e2dbff3968b9d73283663f884"
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
