#!/bin/sh

# Clones Randoop in /tmp/randoop.

set -eux

if [ -d "/tmp/plume-scripts" ] ; then
  git -C /tmp/plume-scripts pull -q > /dev/null 2>&1
else
  git -C /tmp clone --depth 1 -q https://github.com/plume-lib/plume-scripts.git
fi

/tmp/plume-scripts/git-clone-related randoop randoop /tmp/randoop
