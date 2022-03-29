function y() {
  current="$(pwd)"
  while [[ ! -f "$current/.yarnrc.yml" && "$current" != "/" ]]; do
    current="$(dirname "$current")"
  done

  if [[ -e "$current/.yarnrc.yml" ]]; then
    yarn_path="$(rg '^yarnPath: "?(.+?)"?$' "$current/.yarnrc.yml" -r '$1')"
    if [[ -n "$yarn_path" ]]; then
      node "$current/$yarn_path" "$@"
      return $?
    fi
  fi

  yarn "$@"
  return $?
}
