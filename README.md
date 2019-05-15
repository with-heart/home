# Home

This project is designed to be grafted onto my home directory.
I keep the non-standard configs that I prefer to have on a system.

## Installation

To graft a git tree onto an existing directory:

```bash
cd ~/
git init
git remote add origin https://github.com/with-heart/home
git fetch origin
git checkout -b sh --depth 1 --track origin/master -f
```

Which will overwrite any files that exist in this repo and keep any files that do not exist.
Don't worry about cleaning up the `.git/` directory, the gitignore should be zealous enough to keep you from adding without explicitly calling them out.
