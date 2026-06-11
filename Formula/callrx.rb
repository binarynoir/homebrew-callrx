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
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.2.0/callrx-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf5031f7815cc1d4c8ae378e250be07396bf8548edba26a3719dc04533d26306"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.2.0/callrx-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "b96222558b17938918297654757c8d9b51ecaa7730772ab0d7d5d7794e802fd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.2.0/callrx-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f347c00a6ed699f65cff88db23816cc5913ffead58e6d346af7866c08c70eb1c"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.2.0/callrx-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31ea0dc9eeb6e84dbf4d7f17dd0145fcbf557d91335e1c16830fa69788f88e61"
    end
  end

  def install
    bin.install "callrx"
  end

  test do
    assert_match "callrx #{version}", shell_output("#{bin}/callrx --version")
  end
end
