# homebrew-callrx

Homebrew tap for [`callrx`](https://github.com/binarynoir/callrx) — beautiful
amateur radio callsign lookup for the terminal.

[![Support me on Buy Me a Coffee](https://img.shields.io/badge/Support%20me-Buy%20Me%20a%20Coffee-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://buymeacoffee.com/binarynoir)
[![Support me on Ko-fi](https://img.shields.io/badge/Support%20me-Ko--fi-blue?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/binarynoir)

---

## Install

```bash
brew install binarynoir/callrx/callrx
```

Or tap first, then install:

```bash
brew tap binarynoir/callrx
brew install callrx
```

Upgrade to the latest release:

```bash
brew upgrade callrx
```

Uninstall:

```bash
brew uninstall callrx
brew untap binarynoir/callrx
```

## What this installs

The formula downloads the prebuilt release binary for your platform (macOS
Apple Silicon / Intel, Linux x86_64 / ARM64), so no Rust toolchain is required.

## Maintenance

`Formula/callrx.rb` is regenerated automatically on every release by the
`update-homebrew.yml` workflow in the
[binarynoir/callrx](https://github.com/binarynoir/callrx) repository. You should
not need to edit it by hand.

## License

MIT
