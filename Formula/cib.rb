class Cib < Formula
  desc "CIB marketing-intelligence CLI"
  homepage "https://best.ceo"
  url "https://registry.npmjs.org/@bestceo/cli/-/cli-0.1.0.tgz"
  sha256 "5061dfd422d0ae5eb80dc668d360f3bec4aa371187c9b38f858045656d5ecd93"
  license "UNLICENSED"

  # Use unpinned `node` so Homebrew resolves the current LTS (>=22 at time of
  # writing). The CLI's package.json "engines" field is the authoritative
  # version gate; pinning node@20 would prevent Homebrew users from getting
  # security updates tied to the latest LTS.
  depends_on "node"

  def install
    system "npm", "install", "--prefix", libexec, "@bestceo/cli@#{version}"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cib --version")
  end
end
