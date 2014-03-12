require 'formula'

class Drush7 < Formula
  homepage 'https://github.com/drush-ops/drush'
  head 'https://github.com/drush-ops/drush.git'
  url 'https://github.com/drush-ops/drush/archive/master.zip'
  sha1 ''

  def install
    prefix.install_metafiles
    libexec.install Dir['*'] -['drush.bat']
    (bin+'drush').write <<-EOS.undent
      #!/bin/sh

      export ETC_PREFIX=${ETC_PREFIX:=#{HOMEBREW_PREFIX}}
      export SHARE_PREFIX=${SHARE_PREFIX:=#{HOMEBREW_PREFIX}}

      exec "#{libexec}/drush" "$@"
    EOS
    bash_completion.install libexec/'drush.complete.sh' => 'drush'
  end
end