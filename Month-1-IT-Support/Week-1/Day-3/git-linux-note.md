# Git & GitHub — Day 3

Today I started learning Git and GitHub.

## Git Repository and Current State

The first command I used was `git status`. It showed me some interesting information about my repository.

It showed that I already had a Git repository and that I was working on the `main` branch. It also showed that there were tracked files that had been deleted but not yet committed, as well as new files that Git had not started tracking.

This helped me understand that before making a commit, I should first inspect the repository and decide which changes I actually want to keep.

I used commands such as:

* `git status`
* `git diff`
* `git add`
* `git commit`

I used these commands to inspect the changes, decide what should be included, stage the intended changes, and then commit them.

The important lesson for me was that I should not blindly commit everything. I should first understand what has changed, decide what belongs in the commit, and then stage and commit the intended changes.

## Git History

I learned how to inspect the repository's history using:

```bash
git log --oneline --decorate -5
```

This showed me previous commits and helped me understand where `HEAD`, `main`, and `origin/main` were pointing.

I also learned that `git show --stat --oneline HEAD` can show information about the current `HEAD` commit and summarize the files changed by that commit.

## GitHub Remote Repository

I checked whether my local repository had a remote repository configured using:

```bash
git remote -v
```

This showed that the local repository had a remote named `origin` connected to my GitHub repository.

I then successfully pushed my local commit to GitHub using:

```bash
git push
```

This confirmed that my local repository and GitHub remote were able to communicate successfully.

## Git Branches

I learned about Git branches and why they are useful.

A branch allows me to work on changes separately from the `main` branch. This is useful when I want to develop or test something without immediately changing the main line of development.

I practiced:

```bash
git branch
git branch practice
git switch practice
git commit
```

I created a `practice` branch and switched to it. I then created a small change and committed it while on the `practice` branch.

After switching back to `main`, I verified that the new commit was not part of the `main` history and that the file created on the `practice` branch was not present on `main`.

This helped me understand that branches can have different histories and working-tree contents.

## Main Lessons

My main lessons from today are:

1. Inspect the repository before changing it.
2. `git status` shows the current working-tree state.
3. Changes should be reviewed before they are staged and committed.
4. `git log` helps investigate repository history.
5. `git remote -v` shows the configured remote repository.
6. A branch allows work to be developed separately from `main`.
7. `git switch` changes the branch I am currently working on.
8. A commit made on one branch does not automatically appear in another branch.
9. Troubleshooting Git problems should be based on evidence from Git commands rather than guessing.
