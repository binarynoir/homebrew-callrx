# typed: false
# frozen_string_literal: true

# Homebrew formula for callrx — beautiful amateur radio callsign lookup.
#
# This formula installs the prebuilt release binary for your platform, so it
# does not require a Rust toolchain. It is regenerated automatically on every
# release by the `update-homebrew.yml` workflow in binarynoir/callrx.
class Callrx < Formula
  desc "Beautiful amateur radio callsign lookup for the terminal"
  homepage "https://github.com/binarynoir/callrx"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.7.0/callrx-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "4240c4527a1cb15f58231ad8caf4bb281c1065394eb4d4f6e3a45e0c0c654550"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.7.0/callrx-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "42484a8fbf6e5b3c06fa80c004ec9cc9317eb9c0b2299a132c055ae5f45eb65f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.7.0/callrx-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c5c69027e2665afab15c6e60a40139e8f96f8d3906d689aa9c803272582a474"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.7.0/callrx-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "037ed86a448811528978a8105e1bdba7abc323dc3d7c1b0f94e73bdb24104220"
    end
  end

  def install
    bin.install "callrx"
    man1.install "man/callrx.1"
    generate_completions_from_executable(bin/"callrx", "completions")
  end

  def caveats
    <<~EOS
      If callrx is not immediately available in your current shell, run:
        source ~/.zshrc
      or open a new terminal window.
    EOS
  end

  test do
    assert_match "callrx #{version}", shell_output("#{bin}/callrx --version")
  end
end
