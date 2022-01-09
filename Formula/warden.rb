
class Warden < Formula
  desc "Warden is a CLI utility for working with docker-compose environments"
  homepage "https://warden.dev"
  version "0.12.0.7"
  url "https://github.com/ytorbyk/warden/archive/release-0.12.0.7.tar.gz"
  sha256 "ad62fdfc078479caafcb665513f7f808f0db883a169681d69fb9381e72d55be9"
  head "https://github.com/ytorbyk/warden.git", :branch => "release-0.12.0.7"

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

      Documentation is available at: https://docs.warden.dev
    EOS
  end
end
