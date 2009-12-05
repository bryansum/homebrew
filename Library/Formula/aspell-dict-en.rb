require 'formula'

class AspellDictEn <Formula
  url 'ftp://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-6.0-0.tar.bz2'
  homepage 'ftp://ftp.gnu.org/gnu/aspell/dict/0index.html'
  md5 '16449e0a266e1ecc526b2f3cd39d4bc2'

  depends_on 'aspell'

  def install
    system "./configure"
    system "make install"
  end
end
