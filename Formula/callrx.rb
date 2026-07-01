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
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.1/callrx-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "c49348ff7e29298d457ec4c26b61506fa9aba37a633a684bdc8d0c147918ef5f"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.1/callrx-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "d6d93522e41eb76783e51b774d4ce8ef25ba6ee1a247c9bd1aac3f35fbb61511"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.1/callrx-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45548d522cd38bdc5b7594299b06c3ac1e5569eee2be6fd11a0bebd5d71b9712"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.8.1/callrx-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "816be01e03e478b4f7786cb189c8b79ff68022051fab0a90cd27ba5a89b03b72"
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
