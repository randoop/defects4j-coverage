#!/bin/sh

# Clones defects4j in a sibling directory of the current one.

set -eux

if [ -d "/tmp/plume-scripts" ] ; then
  git -C /tmp/plume-scripts pull -q > /dev/null 2>&1
else
  git -C /tmp clone --depth 1 -q https://github.com/plume-lib/plume-scripts.git
fi

/tmp/plume-scripts/git-clone-related rjust defects4j
