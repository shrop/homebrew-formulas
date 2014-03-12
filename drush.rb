require 'formula'

class Drush < Formula
  homepage 'https://github.com/drush-ops/drush'
  head 'https://github.com/shrop/drush.git'
  url 'https://github.com/shrop/drush/archive/dev-20130312.tar.gz'
  
  def install
    prefix.install_metafiles
    libexec.install Dir['*'] -['drush.bat']
    (bin+'drush').write <<-EOS.undent
      #!/bin/sh

      export ETC_PREFIX=${ETC_PREFIX:=#{HOMEBREW_PREFIX}}
      export SHARE_PREFIX=${SHARE_PREFIX:=#{HOMEBREW_PREFIX}}

      exec "#{libexec}/drush" "$@"
    EOSsubl 
    bash_completion.install libexec/'drush.complete.sh' => 'drush'
  end
end