require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.6.tgz"
  sha256 "a3e2c92f99afdbb63dd93e4aced159543d6394f7f0ffdec59ea7ec9ab2162b91"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "29987e77b5f43778cd6f882dd9f3731d4158c05cc9e9833899344f0e4bfc20fb"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
