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
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.4.0/callrx-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "18bf71a0a77fca4beb5ec5508314124323b95a5569b9583b2ab79a83390130a9"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.4.0/callrx-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "338e48b3a11c33e3a0b5ed50bf668a3d7203e1ae6fdba3ad1666d9063dd52dfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.4.0/callrx-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c241519be977eb448fc944e3b2cd26cb2d9084d1827fc557e258d5f826d5f24"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.4.0/callrx-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a71d7660cd713402ab21e08818a6c51e40831a6f204096cd0ece27a4eb5eaddd"
    end
  end

  def install
    bin.install "callrx"
    man1.install "man/callrx.1"
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
