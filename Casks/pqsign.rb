cask "pqsign" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "7c721bdc5a88c0fd07884c3b044d7cd7ea8c1e0265a7248824e0f0c73e368524"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "e2faf81eb11c1eea696905d9726aba3c8be234d6bfa465e9bd2a66f881605ec3"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-x86_64-apple-darwin.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "3ca0f230daa6651beb0f8f1696d3277ae96bd50690046b7dfaa499fb2eeb2942"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "f061e71c8ae150a733818a7732026d3f749162f284b016fd4c29c248c0207e61"
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

  # No zap stanza required
end
