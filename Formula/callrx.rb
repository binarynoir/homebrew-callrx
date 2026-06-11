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
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.1.1/callrx-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "359150b566de76843caf53d4649ccc49bdb743ef8224494acdecffd687bb4692"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.1.1/callrx-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "b0d3fa4fb66f6c47057c81622d7d2452d89c66f1e27f7b7e5494f63d096c477c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.1.1/callrx-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8df3bce4624e212ee22104ea4a0a1fbf569cc55eede8f3a2c6a34ed2a62582ae"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.1.1/callrx-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a6f7edb5b55db104c7b98616e5fbe69dc193dc83dad6d0805cd9d80470f06ce"
    end
  end

  def install
    bin.install "callrx"
  end

  test do
    assert_match "callrx #{version}", shell_output("#{bin}/callrx --version")
  end
end
