require 'formula'

class Phpsh <Formula
  url 'http://github.com/facebook/phpsh/tarball/master'
  homepage 'http://www.phpsh.org/'
  md5 '893e3cb75fdb445e681d0ab4d7815be7'
  version '1.2'

  def install
    system "python", "setup.py", "build"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
