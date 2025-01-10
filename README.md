# pml-course
This is a self paced, minimal instruction to learn modelling in the Perspectives Modelling Language. As a companion to the instructions found here, you can use the following reference material:
* [old reference (complete)](https://joopringelberg.github.io/perspectives-documentation/perspectives%20language%20reference.html)
* [new reference, only very partially completed](https://mycontexts.com/reference/overview.html)

## Getting MyContexts
In order to be able to make the assignments in this course, you need access to MyContexts. That is actually pretty simple: just go to https://mycontexts.com and it will be added to your browser as a WebApp.

Next, you'll need access to a Perspectives Repository in order to be able to upload and compile a Perspectives Model. As of this moment, that requires you to contact the Perspectives project. In the future, we'll have a semi-automated procedure to get your own Perspectives Repository.

In the assignment material, we assume you have MyContexts and access to a Repository.

## How to use this material
Even while this repository is public, you are not encouraged to work in it directly. Instead, **fork** it and clone your fork on your computer. This setup allows you to keep up with new material in the main pml-course repository by syncing your fork with it. It also allows you to save your own work assignments in your fork. And finally, you can even suggest improvements by making pull requests.

1. Begin by __forking__ this repository on Github. 
2. Then, __clone__ it to your workstation.
```
git clone https://github.com/your-username-on-github/pml-course.git
```
3. In the `myownwork` directory, create the files as instructed in the assignments. You can submit this work to your forked repository.

### Keeping Your Fork Up to Date
If new material is added to the main repository, you can sync your fork to get the updates. Follow these steps:

1. Open your terminal and navigate to the folder where your project is stored.

1. Add the original repository (upstream) as a remote (if you haven’t done this already; this step should be performed only once):

```
git remote add upstream https://github.com/joopringelberg/pml-course.git
```

3. Fetch the latest changes from the original repository:

```
git fetch upstream
```

4. Merge or rebase the updates into your local branch:

* Merge (simpler):
```
git merge upstream/main
```
* Rebase (cleaner history):

```
git rebase upstream/main
```
5. Push the updates to your fork on GitHub:

```
git push origin main
```

Steps 3 through 5 fetch updates from the main project and save them in your local repository and in your fork on Github.

### Contributing to the main repository pml-course
If you find an error, have thoughts about an improvement or otherwise want to contribute, create a branch in your local repository, edit the assignments, commit, push and open a pull request.

1. Create a new branch for your corrections.

```
git checkout -b correction-branch
```

2. Make your changes and commit them.

```
git commit -m "Fix typo in Stage1 README"
```

3. Push the branch to your fork.
```
git push origin correction-branch
```

4. Open a pull request to this repository on GitHub.