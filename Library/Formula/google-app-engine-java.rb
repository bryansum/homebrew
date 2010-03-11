require 'formula'

class GoogleAppEngineJava <Formula
  url 'http://googleappengine.googlecode.com/files/appengine-java-sdk-1.3.1.zip'
  homepage 'http://code.google.com/appengine/'
  md5 'fa660a96968c66d5c2d17c276d129d78'

  def patches
    # fix paths in shell scripts.
    DATA
  end

  def install
    cd '..'
    share.install 'appengine-java-sdk-1.3.1' => name
    mkdir bin
    %w[appcfg.sh dev_appserver.sh].each do |fn|
      ln_s share+name+'bin'+fn, bin+fn
    end
  end
end

__END__
diff -u a/bin/appcfg.sh b/bin/appcfg.sh
--- a/bin/appcfg.sh
+++ b/bin/appcfg.sh
@@ -2,8 +2,8 @@
 # Launches AppCfg
 [ -z "${DEBUG}" ] || set -x  # trace if $DEBUG env. var. is non-zero
 SDK_BIN=`dirname $0 | sed -e "s#^\\([^/]\\)#${PWD}/\\1#"` # sed makes absolute
-SDK_LIB=$SDK_BIN/../lib
-SDK_CONFIG=$SDK_BIN/../config/sdk
+SDK_LIB=$SDK_BIN/../share/google-app-engine-java/lib
+SDK_CONFIG=$SDK_BIN/../share/google-app-engine-java/config/sdk
 
 java -cp "$SDK_LIB/appengine-tools-api.jar" \
     com.google.appengine.tools.admin.AppCfg $*
diff -u a/bin/dev_appserver.sh b/bin/dev_appserver.sh
--- a/bin/dev_appserver.sh
+++ b/bin/dev_appserver.sh
@@ -2,8 +2,8 @@
 # Launches the development AppServer
 [ -z "${DEBUG}" ] || set -x  # trace if $DEBUG env. var. is non-zero
 SDK_BIN=`dirname $0 | sed -e "s#^\\([^/]\\)#${PWD}/\\1#"` # sed makes absolute
-SDK_LIB=$SDK_BIN/../lib
-SDK_CONFIG=$SDK_BIN/../config/sdk
+SDK_LIB=$SDK_BIN/../share/google-app-engine-java/lib
+SDK_CONFIG=$SDK_BIN/../share/google-app-engine-java/config/sdk
 java -ea -cp "$SDK_LIB/appengine-tools-api.jar" \
   com.google.appengine.tools.KickStart \
   com.google.appengine.tools.development.DevAppServerMain $*
