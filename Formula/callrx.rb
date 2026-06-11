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
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.3.0/callrx-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "85b54bfb75e0f3265454198247ccf6088e95162d97153ebc8de975f1617a0dd9"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.3.0/callrx-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "65976cbe1bd207e42f80ef4a7e2813b26f33dc5a8e86a8536011f4ac6413a3a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.3.0/callrx-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41e2b31c858c2d024c8394daf2d336dca4c19671db38b2b80cae9da1359680f7"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.3.0/callrx-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1fa5e9529e764fc8cabee7baab2c7c439ad9fbe9a4e651a5943c3c973616fb6"
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
