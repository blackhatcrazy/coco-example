#!/usr/bin/env bash

repo="https://github.com/SAP/configuration-tools-for-gitops"
version="v2.1.0"


target="dist"
tmp="tmp"

function main() {
  tld=$(git rev-parse --show-toplevel)
  script_dir=$(basename $0 | cut -f1 -d".")
  tmp_dir="${tld}/${tmp}/${script_dir}"

  os=$(uname -s | tr '[:upper:]' '[:lower:]')
  arch=$(uname -m | tr '[:upper:]' '[:lower:]')
  file="coco_${os}_${arch}.tar.gz"
  mkdir -p "${tld}/${target}"
  mkdir -p "${tmp_dir}"
  cd "${tmp_dir}" && \
    curl --retry 5 -LO "${repo}/releases/download/${version}/${file}" \
      && tar -zxf "${file}" \
      && rm "${file}" \
      && chmod +x coco \
      && mv coco "${tld}/${target}/coco"
  
  rm -r "${tmp_dir}"

}

function set_user_variables() {
  if [[ $(uname -s) == "Darwin" ]]; then
    export uid=$(id -u)
    export gid=$(id -g)  
  elif [[ $(uname -s) == "Linux" ]]; then
    export uid=$(id --user)
    export gid=$(id --group)
  fi
  if [[ $(uname -m) == "arm64" ]]; then
    export image_arch_suffix="arm64"
  else
    export image_arch_suffix="amd64"
  fi
}

main "${@}"