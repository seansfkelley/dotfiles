stg() {
  if [ "$#" -ne 2 ]; then
    echo "usage: stg <app> <tag>"
    return 1
  fi

  pushd ~/code/aws-infrastructure
  poetry run invoke k8s.update-deployment -e stg -a "$1" -t "$2"
  popd
}

prod() {
  if [ "$#" -ne 2 ]; then
    echo "usage: stg <app> <tag>"
    return 1
  fi

  pushd ~/code/aws-infrastructure
  poetry run invoke k8s.update-deployment -e prod -a "$1" -t "$2"
  popd
}

alias k=kubectl
