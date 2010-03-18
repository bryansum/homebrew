require 'formula'

class Openimageio <Formula
  homepage 'http://openimageio.org/wiki/index.php?title=Main_Page'
  head 'http://svn.openimageio.org/oiio/trunk', :revision => 1343
  version '0.7.0'

  depends_on 'cmake'
  depends_on 'boost'
  depends_on 'openexr'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'jasper'

  def download_strategy
    SubversionDownloadStrategy
  end

  def install
    make_opts = [ "USE_QT=0",
                  "EMBEDPLUGINS=1"]
    system "make", *make_opts
    # No "make install"
    prefix.install 'dist/macosx/bin'
    prefix.install 'dist/macosx/include'
    prefix.install 'dist/macosx/lib'
    doc.install Dir['dist/macosx/doc/*']
  end
end
