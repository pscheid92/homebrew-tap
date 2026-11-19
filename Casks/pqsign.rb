cask "pqsign" do
  version "0.5.0"

  on_macos do
    on_arm do
      sha256 "a4e68aa069ba427c16d97adeba5d3421f207f2a3b814e9ad78efda8e2eb38368"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "daacf67f41df61b5f1977dbdb158bd08f9acac2f1fdf108a550f51c75da1cb09"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-x86_64-apple-darwin.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "0f8ba8502baedfc3612fa3cb62870afffc33b1e3113630a0a7b7afb18383faa9"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "c18e5e4453e95f1b590b160bb51ed0854521a02088b9316611a2c3c1d94d07ba"
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
