# Git

[Git Doc](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)  
[YT video in 2 minutes](https://www.youtube.com/watch?v=2ReR1YJrNOM)  
[Odin Git Tutorial](https://www.theodinproject.com/lessons/foundations-git-basics)

## What is Git & GitHub?

* `Version Control`: any system that allows you to understand the history of the file and how it has progressed

* `Git`: a version `control` `program` which allows you to annotate the changes you make to create an easily traversable system history

* `Commit`: an annotated “snapshot” of the differences made to the system at a given point in time

* `Local`: refers to the computer you’re working on this very minute

* `Remote`: refers to an online location

* `Repository (repo)`: a special folder configured with Git superpowers containing all the files pertaining to your project/system

* `Github`: takes your local commit history and hosts it remotely so that you can access it from any computer

* `Pushing`: the action of taking local Git commits (and whatever work these encompass) and putting them online on Github

* `Pulling`: the action of taking online Github commits and bringing them into your local machine

* `Master (branch)`: the “trunk” of the commit history “tree”; contains all approved content/code

* `Feature branch`: an isolated location, based off of master, where you can write a new piece of work safely before reincorporating said changes back to master

* `Pull Request`: a Github tool that allows users to easily see the changes (the difference or “diff”) that a feature branch is proposing as well as discuss any tweaks that said branch might require before it is merged into master

* `Merging`: the action of taking the commits from a feature branch and adding them to the top of master’s history

* `Checking out`: the action of moving from one branch to another

## Practice

### Local 
```bash
mkdir repos
cd repos
```

### Clone repo (SSH)
```bash
git clone git@github.com:TonyDN98/web_learn.git
cd web_learn
git remote -v
```

### remote -v
*origin is the name convention for remote repo*  
**origin**  https://github.com/TonyDN98/web_learn (fetch)  
**origin**  https://github.com/TonyDN98/web_learn (push)

### Use the Git workflow

```bash
cd web_learn
touch hello_world.txt
git status 
```
*hello_world.txt file is shown in red, which means that this file is not staged*

### Add to stagging area
```bash
git add hello_world.txt
```

*This command adds your hello_world.txt file to the `staging area` in Git. The `staging area` is part of the two-step process for making a commit in Git. Think of the `staging area` as a “`waiting room`” for your changes until you commit them. Now, type git status again. In the output, notice that your file is now shown in `green`, which means that this file is now in the staging area.*

![staging-area](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/08.png)

### Commit and status
```bash
git commit -m "Add hello_world.txt"
git status
```

*The output should now say: “nothing to commit, working tree clean”, indicating your changes have been committed. Don’t worry if you get a message that says “upstream is gone”. This is normal and only shows when your cloned repository currently has no branches. It will be resolved once you have followed the rest of the steps in this project.*

![git-status-after-commit](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/09.png)

### See the output 
```bash
git log
```

![git-log-after](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/10.png)

### Push to origin

```bash
git push origin main
```
![push-origin](https://cdn.statically.io/gh/TheOdinProject/curriculum/b54d14c5dcee1c6fac61aee02fca7e9ef7ba1510/foundations/git_basics/project_practicing_git_basics/imgs/18.png)

> NOTE: Push to ORIGIN repo FROM  main BRANCH






