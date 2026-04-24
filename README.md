# homebrew-cib-tap

Official Homebrew tap for [`@cib/cli`](https://www.npmjs.com/package/@cib/cli) — the CIB marketing-intelligence CLI.

## Install

```bash
brew tap AytuncYildizli/cib-tap
brew install cib
```

Then authenticate:

```bash
cib login
cib analyze https://your-site.com --watch
```

## What's included

- **`cib`** — CIB marketing-intelligence CLI (Node 22+, auto-installed as a Homebrew dependency)

Full command reference: [docs/mcp](https://best.ceo/docs/mcp).

## Releasing a new version

1. Publish to npm: `pnpm --filter @cib/cli publish --access public`
2. Compute sha256 of the published tarball:
   ```bash
   curl -sL https://registry.npmjs.org/@cib/cli/-/cli-<VERSION>.tgz | shasum -a 256
   ```
3. Edit `Formula/cib.rb` — bump `version`, replace `url`, replace `sha256`
4. Commit + push. `brew update && brew upgrade cib` picks up the new version.
