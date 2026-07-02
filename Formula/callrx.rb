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
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.0/callrx-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "2faaf731beed2ebd085f42434855c12f14712688391c21de19385616c51baa74"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.0/callrx-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "b832f4c717c98986a4fd6003eb61add4b9dd7e61929e7cb8542983b2286ff763"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.0/callrx-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7d217cc5afd3283f81626cfa6fe8d2fa77b8a9418c8e105d179c1e30895fd49"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.0/callrx-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be2201d70264503bc6adb6d2dccfe4f2b45359b0a605fce1d95b71d54bc10ef5"
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
