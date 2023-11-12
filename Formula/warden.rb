
class Warden < Formula
  desc "Warden is a CLI utility for working with docker-compose environments"
  homepage "https://github.com/ytorbyk/warden"
  version "0.14.1.1"
  url "https://github.com/ytorbyk/warden/archive/0.14.1.1.tar.gz"
  sha256 "1504da81d5b884a92df35baf74209183e322e1cde854b9a38a1efe118cfb7754"
  head "https://github.com/ytorbyk/warden.git", :branch => "main"

  depends_on "gettext"
  depends_on "mkcert" => :recommended
  depends_on "nss" => :recommended
  depends_on "pv" => :recommended

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      Warden manages a set of global services on the docker host machine. You
      will need to have Docker installed and docker-compose available in your
      local $PATH configuration prior to starting Warden.

      To start warden simply run:
        warden svc up

      This command will automatically run "warden install" to setup a trusted
      local root certificate and sign an SSL certificate for use by services
      managed by warden via the "warden sign-certificate warden.test" command.

      To print a complete list of available commands simply run "warden" without
      any arguments.
    EOS
  end
end
