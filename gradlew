#!/bin/sh
#
# Gradle startup script for POSIX systems.
#
APP_HOME=`pwd -P`
APP_NAME="Gradle"
APP_BASE_NAME=${0##*/}
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'
MAX_FD=maximum

warn() { echo "$*"; }
die() { echo; echo "$*"; echo; exit 1; }

cygwin=false; msys=false; darwin=false; nonstop=false
case "$(uname)" in
  CYGWIN*)  cygwin=true  ;;
  Darwin*)  darwin=true  ;;
  MSYS*|MINGW*) msys=true ;;
  NONSTOP*) nonstop=true ;;
esac

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/jre/sh/java" ]; then
        JAVA_CMD="$JAVA_HOME/jre/sh/java"
    else
        JAVA_CMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVA_CMD" ]; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
    fi
else
    JAVA_CMD="java"
    command -v java >/dev/null 2>&1 || die "ERROR: 'java' not found in PATH."
fi

if ! "$cygwin" && ! "$darwin" && ! "$nonstop"; then
    case $MAX_FD in
      max*) MAX_FD=$(ulimit -H -n) || warn "Could not query max fd" ;;
    esac
    case $MAX_FD in
      ''|soft) ;;
      *) ulimit -n "$MAX_FD" || warn "Could not set max fd to $MAX_FD" ;;
    esac
fi

exec "$JAVA_CMD" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS \
    "-Dorg.gradle.appname=$APP_BASE_NAME" \
    -classpath "$CLASSPATH" \
    org.gradle.wrapper.GradleWrapperMain \
    "$@"
