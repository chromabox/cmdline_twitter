#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([cmdline_twitter], [0.0.3], [newserver002@gmail.com], [cmdline_twitter], [https://github.com/chromabox/cmdline_twitter])
AM_INIT_AUTOMAKE([-Wno-portability])
AM_SILENT_RULES([yes])
AC_CONFIG_SRCDIR([main.hpp])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_LIBTOOL_WIN32_DLL
LT_INIT

# Checks for libraries.
dnl -------
dnl set my_cv_curl_vers to the version of libcurl or NONE
dnl if libcurl is not found or is too old
AC_DEFUN([MY_CURL],[
 AC_CACHE_VAL(my_cv_curl_vers,[
 my_cv_curl_vers=NONE
 dnl check is the plain-text version of the required version
 check="7.10.0"
 dnl check_hex must be UPPERCASE if any hex letters are present
 check_hex="070A00"
 dnl for cross compiling, variable curl-config 
 AC_PATH_PROGS(CURLCONFIG, curl-config)
 
 AC_MSG_CHECKING([for curl >= $check])
 
 if eval $CURLCONFIG --version 2>/dev/null >/dev/null; then
   ver=`$CURLCONFIG --version | sed -e "s/libcurl //g"`
   hex_ver=`$CURLCONFIG --vernum | tr 'a-f' 'A-F'`
   ok=`echo "ibase=16; if($hex_ver>=$check_hex) $hex_ver else 0" | bc`
 
   if test x$ok != x0; then
     my_cv_curl_vers="$ver"
     AC_MSG_RESULT([$my_cv_curl_vers])
     CURL_LIBS=`$CURLCONFIG --libs`
     CURL_CFLAGS=`$CURLCONFIG --cflags`
     LIBS="$LIBS $CURL_LIBS"
   else
     AC_MSG_RESULT(FAILED)
     AC_MSG_WARN([$ver is too old. Need version $check or higher.])
   fi
 else
   AC_MSG_RESULT(FAILED)
   AC_MSG_WARN([curl-config was not found])
 fi
 ])
])

MY_CURL
AC_SUBST(CURL_CFLAGS)

# Checks for header files.
AC_CHECK_HEADERS([float.h inttypes.h limits.h locale.h stdint.h sys/time.h])

# Input API KEYS (CONSUMER_KEY)
AC_MSG_CHECKING([for whether to use consumer key])
AC_ARG_ENABLE(consumer_key, [AS_HELP_STRING(
  [--enable-consumer-key], [build cmdline_twitter with CONSUMER_KEY [default=none]])], 
  [], [])
if test x"$enable_consumer_key" != "x";then
   AC_MSG_RESULT([CONSUMER_KEY is successfully inputted])
   AC_DEFINE_UNQUOTED([CONSUMER_KEY], [$enable_consumer_key], [cmdline_twitter CONSUMER_KEY])
else
   AC_MSG_ERROR([CONSUMER_KEY can not find from enviroment! you must define CONSUMER_KEY])
fi

# Input API KEYS (CONSUMER_SECRET)
AC_MSG_CHECKING([for whether to use consumer secret])
AC_ARG_ENABLE(consumer_secret, [AS_HELP_STRING(
  [--enable-consumer-secret], [build cmdline_twitter with CONSUMER_SECRET [default=none]])], 
  [], [])
if test x"$enable_consumer_secret" != "x";then
   AC_MSG_RESULT([CONSUMER_SECRET is successfully inputted])
   AC_DEFINE_UNQUOTED([CONSUMER_SECRET], [$enable_consumer_secret], [cmdline_twitter CONSUMER_SECRET])
else
   AC_MSG_ERROR([CONSUMER_SECRET can not find from enviroment! you must define CONSUMER_SECRET])
fi

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_C_INLINE
AC_TYPE_INT64_T
AC_TYPE_MODE_T
AC_TYPE_SIZE_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T
AC_TYPE_UINT8_T

# Checks for library functions.
AC_FUNC_STRTOD
AC_CHECK_FUNCS([gettimeofday localeconv localtime_r memset mkdir modf setlocale tzset strptime timegm])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
