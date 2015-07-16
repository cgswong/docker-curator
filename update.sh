#! /usr/bin/env bash
# ###################################################
# DESC.: Update Dockerfile for each version directory.
#        Show some information on each version.
# ###################################################
set -e

declare -A aliases
aliases=(
  [3.2.2]='latest'
)

# Script directory
cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
downloadable=$(curl -sSL 'https://github.com/elastic/curator/releases' | sed -rn 's!.*/elastic/curator/archive/v([0-9]+\.[0-9]+\.[0-9]).*!\1!gp' | uniq)
url='git://github.com/cgswong/docker-curator'

for version in "${versions[@]}"; do
  recent=$(echo "$downloadable" | grep -m 1 "$version")
  sed 's/%%VERSION%%/'"$recent"'/' <Dockerfile.tpl >"$version/Dockerfile"

  commit="$(git log -1 --format='format:%H' -- "$version")"
  fullVersion="$(grep -m1 'ENV CURATOR_VERSION' "$version/Dockerfile" | cut -d' ' -f3)"

  versionAliases=()
  while [ "$fullVersion" != "$version" -a "${fullVersion%[-]*}" != "$fullVersion" ]; do
    versionAliases+=( $fullVersion )
    fullVersion="${fullVersion%[-]*}"
  done
  versionAliases+=( $version ${aliases[$version]} )

  for va in "${versionAliases[@]}"; do
    echo "$va: ${url}@${commit} $version"
  done
done
