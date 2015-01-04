AUTOMAKE_OPTIONS 	= foreign subdir-objects
ACLOCAL_AMFLAGS		= -I m4

HASH_SRCS 		= hashcodes/crypto_hash.cpp hashcodes/sha1.cpp hashcodes/md5.cpp
HTTP_SRCS 		= http/httpclient.cpp http/httpcurl.cpp
AUTH_SRCS 		= oauth/base64.cpp oauth/oauth.cpp
TWCR_SRCS 		= twitter/twitter_client.cpp
UI_SRCS   		= ui/simple_ui.cpp ui/simple_terminal.cpp
SRCS	  		= main.cpp
KEYS	  		= keys/apikeys.hpp

### Bin Target
bin_PROGRAMS		= ctw
ctw_SOURCES		= $(HASH_SRCS) $(HTTP_SRCS) $(AUTH_SRCS) $(TWCR_SRCS) $(UI_SRCS) $(SRCS)
ctw_CXXFLAGS		= @CURL_CFLAGS@		      \
			  -I$(top_builddir)/hashcodes \
			  -I$(top_builddir)/http      \
			  -I$(top_builddir)/oauth     \
			  -I$(top_builddir)/twitter   \
			  -I$(top_builddir)/ui        \
			  -I$(top_builddir)/include

### Lib Target
lib_LTLIBRARIES		= libctw.la
libctw_la_SOURCES	= $(HASH_SRCS) $(HTTP_SRCS) $(AUTH_SRCS) $(TWCR_SRCS) $(UI_SRCS)
libctw_la_CXXFLAGS	= @CURL_CFLAGS@		      \
			  -I$(top_builddir)/hashcodes \
			  -I$(top_builddir)/http      \
			  -I$(top_builddir)/oauth     \
			  -I$(top_builddir)/twitter   \
			  -I$(top_builddir)/ui        \
			  -I$(top_builddir)/include
# libtool versioning -> http://ftp.gnu.org/pub/old-gnu/Manuals/libtool-1.4.2/html_chapter/libtool_6.html
libctw_la_LDFLAGS	= -no-undefined -version-info 0:0:0

# chain with ChangeLog
dist-hook: ChangeLog

# work when configure.ac is updated
ChangeLog: configure.ac
	git log --stat --name-only --date=short --abbrev-commit > ChangeLog

$(KEYS):
	-@ ./write_apikeys.sh
