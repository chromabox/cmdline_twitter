AUTOMAKE_OPTIONS 	= foreign subdir-objects
ACLOCAL_AMFLAGS		= -I m4

HASH_SRCS 		= hashcodes/crypto_hash.cpp hashcodes/sha1.cpp hashcodes/md5.cpp
HTTP_SRCS 		= http/httpclient.cpp http/httpcurl.cpp
AUTH_SRCS 		= oauth/base64.cpp oauth/oauth.cpp
TWCR_SRCS 		= twitter/twitter_client.cpp
UI_SRCS   		= ui/simple_ui.cpp ui/simple_terminal.cpp
SRCS	  		= main.cpp
KEYS	  		= keys/apikeys.hpp

### Target
bin_PROGRAMS		= ctw
ctw_SOURCES		= $(HASH_SRCS) $(HTTP_SRCS) $(AUTH_SRCS) $(TWCR_SRCS) $(UI_SRCS) $(SRCS)
ctw_CXXFLAGS		= @CURL_CFLAGS@		      \
			  -I$(top_builddir)/hashcodes \
			  -I$(top_builddir)/http      \
			  -I$(top_builddir)/oauth     \
			  -I$(top_builddir)/twitter   \
			  -I$(top_builddir)/ui        \
			  -I$(top_builddir)/include

# chain with ChangeLog
dist-hook: ChangeLog

# work when configure.ac is updated
ChangeLog: configure.ac
	git log --stat --name-only --date=short --abbrev-commit > ChangeLog

$(KEYS):
	-@ ./write_apikeys.sh
