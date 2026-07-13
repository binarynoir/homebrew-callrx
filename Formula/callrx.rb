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
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.10.0/callrx-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "afe9dead23a1cc25ad735bfeee808202d7f2b1d60f7db6338a5a85c67a537d60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.10.0/callrx-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffd2bce3388b089a3609eb27eea6aad805bb8d42e3e6e647d6f1168cf018da48"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.10.0/callrx-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe68f3e36a27b57a125b917acc6b7e24375aa22f492b5f52ddd27282ed4df855"
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
