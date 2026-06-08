# via https://mijndertstuij.nl/posts/life-is-too-short-for-a-slow-terminal/

autoload -Uz compinit
# (#qNmh-24) = "exists and was modified within the last 24 hours"
if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
  compinit -C
else
  compinit
fi
