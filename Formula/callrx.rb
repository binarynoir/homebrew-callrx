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
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "d8761d95aa06f01c4b54d50261362ea44433013e08b037797c01805a85525d1a"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "35ed5558d04d62193e639907446ecc033027076cc13a4008820f261f929efda4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c5998efd62090ebb9470874cde422c33e42fac593ff6c0d5a7b5ee64de1d00b"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90804611a8a868b2bfeaa8f07ac8928ddd6f47e597f168cd7471daedfc0547c6"
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
