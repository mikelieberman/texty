#! /bin/bash

# Cygwin check.
if [[ "$(uname -s)" == CYGWIN* ]] ; then
    TEXTY_CYGWIN=1
fi
cygcheck() {
    [ $TEXTY_CYGWIN ]
}

# Fix up Cygwin paths.
cygfix() {
    cygcheck && echo "$(cygpath -w $@)" || echo "$@"
}

# Run tika.
TIKA_PATH=$(cygfix "$TEXTY_HOME/lib/tika-app-1.5.jar")
texty_tika() {
    java -jar "$TIKA_PATH" "$@"
}

# Run OpenNLP.
OPENNLP_PATH=$(cygfix "$TEXTY_HOME/lib/apache-opennlp-1.5.3/bin/opennlp")
# OpenNLP needs the batch version if in Cygwin.
cygcheck && OPENNLP_PATH="$OPENNLP_PATH.bat"
texty_opennlp() {
    "$OPENNLP_PATH" "$@"
}

# Run Mallet.
export MALLET_HOME="$(cygfix $TEXTY_HOME/lib/mallet-2.0.7)"
MALLET_PATH="$MALLET_HOME/bin/mallet"
# Needs batch version if in Cygwin.
cygcheck && MALLET_PATH="$MALLET_PATH.bat"
texty_mallet() {
    "$MALLET_PATH" "$@"
}

# Convert file(s) to lines of text.
to_text() {
    for file in "$@" ; do
        texty_tika -t -eUTF-8 "$file" | \
            perl -e '$d = do {undef($/); <>}; $d =~ s#\s+# #gs; print "$d\n"'
    done
}

