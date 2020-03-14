#!/bin/sh

# Clones Randoop in /tmp/randoop.

set -eux

if [ -d "/tmp/plume-scripts" ] ; then
  git -C /tmp/plume-scripts pull -q > /dev/null 2>&1
else
  git -C /tmp clone --depth 1 -q https://github.com/plume-lib/plume-scripts.git
fi

/tmp/plume-scripts/git-clone-related randoop randoop /tmp/randoop
# Print Randoop version number
(LIBS=/tmp/randoop/build/libs/ && cd /tmp/randoop && rm -rf ${LIBS} && ./gradlew assemble && java -classpath ${LIBS}/randoop-all-*.jar randoop.main.Main help | grep version)
