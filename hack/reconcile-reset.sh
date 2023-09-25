#!/usr/bin/env bash


tmp_location=""${HOME}/src/github.com/example""


function main() {
  tld=$(git rev-parse --show-toplevel)
  script_dir=$(basename $0 | cut -f1 -d".")
  tmp_dir="${tld}/${tmp}/${script_dir}"


  rm -rf "${tmp_location}"
  reconcile_branch="branch-to-reconcile"
  new_file="branch-to-reconcile"
  main_file="new-file-in-main"
	git checkout main
	git reset --hard origin/main
	rm -rf "${new_file}"
  rm -rf "${main_file}"
  git add .
  git commit -m "cleanup reconciliation"
  git push
  
	git switch "${reconcile_branch}" 2>/dev/null || git switch  "${reconcile_branch}"
	git reset --hard origin/main
	touch "${new_file}"
  git add "${new_file}"
  git commit -m "add file in branch"
	git push --force

  git checkout main
  touch "${main_file}"
  git add "${main_file}"
  git commit -m "add file in main"
	git push

}

main "${@}"