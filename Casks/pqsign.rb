cask "pqsign" do
  version "0.6.0"

  on_macos do
    on_arm do
      sha256 "fabf87e22f957807d56bfb9e927da84796202ea0f998c75b5d485fde59ea4eef"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "66701881a25b6bcb5e42f84cc7a510e824f2e3c05f19c72be6eace26e17f06b6"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-x86_64-apple-darwin.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f2bba2ef9e35972ae1f942ef1b9fa1442d3424bae5661fb9c68644f47223d059"
      url "https://github.com/pscheid92/pqsign/releases/download/v#{version}/pqsign-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "7d29c2143fc8027e0309401b50d05b60804be2984eb3e0aedd20e459130c2cd6"
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
