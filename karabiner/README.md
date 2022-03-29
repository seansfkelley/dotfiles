```sh
rm ~/.config/karabiner/karabiner.json
ln -s <path-to-dropbox>/configs/karabiner/<config-of-your-choice> ~/.config/karabiner/karabiner.json
```

Note that if you change any settings, Karabiner will drop the symlink and replace it with a regular file. Try to remember to copy the file to Dropbox and re-symlink to keep others up to date!