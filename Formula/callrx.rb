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
      sha256 "b8cedd1479749161c778a8410fd17b83ce03a08a55f505cbf89a656d6b9f0a89"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "256f3a3ce3098b33eed341027414a1967f1774655ae0d4ad701b630d24d34221"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84fdba12feaf0a6862a726d4d3a70e0edd01ee79559eb2a6b0615b2ee4f24c46"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.0/callrx-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a2b8a2f5c7c1e12cfa5f2c7e237af7ce86ffa55aeac4f7d499afdeb1187df00"
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
