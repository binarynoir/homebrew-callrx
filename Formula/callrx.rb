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
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.5.0/callrx-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "2f1b472933dc25b2cb89c7fccbd70c1707ed46f554a326556e9d6da5bfae1841"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.5.0/callrx-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "e07cebbee249343b8fb05038dc156baaeb6d41fd69f19b649c78d6ead3577fd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.5.0/callrx-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb052d72a287a6fbe9840a9f4510dde377a70e3b7b05319ff326d1761fd02ab2"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.5.0/callrx-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "711ae602327599fbb3ea33293d17c2662d97044a937dcfe56095ce888637b2f3"
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
