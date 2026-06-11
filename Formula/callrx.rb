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
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.6.0/callrx-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "2e3e5af53fa78235d49a4e025e7e93b1b255ffd95434ecb5ed9d9242f0f8d022"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.6.0/callrx-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "cc13432e12580dffdaa5085d494fc48d74adf54f8126a255460deb7ed19dffaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.6.0/callrx-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "772c6b4bd12fe2818c832d1b14d7418855af774a5b6054afa8361b87022c8e69"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.6.0/callrx-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09f7f3d5efd178fe9affa075a5aa5263c524f1f6aa5622c105f5cd9bfffd790e"
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
