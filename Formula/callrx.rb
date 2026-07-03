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
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.2/callrx-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "64c57c476e21f9bcd250508781756393e2ce7432f19450ed84a8ff312c016467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.2/callrx-v0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b75e8c1df3d2560f3c7b02951c4a05289f49719fede24e2bd00c928f326a80e"
    end
    on_intel do
      url "https://github.com/binarynoir/callrx/releases/download/v0.9.2/callrx-v0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f106afde591333a7b50dc4f33168147176f9cb371effb7f19ffa1ae1c909ac1"
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
