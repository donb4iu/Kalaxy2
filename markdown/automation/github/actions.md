# Git Actions

![alt text](image.png)

## Resources

- [Copy files to another repository](https://github.com/marketplace/actions/copy-files-to-another-repository)
- [github-action-push-to-another-repository](https://github.com/cpina/github-action-push-to-another-repository)
- [Welcome to github-action-push-to-another-repository’s documentation!](https://cpina.github.io/push-to-another-repository-docs/)
- [Deploying static sites to GitHub Pages using GitHub Actions](https://medium.com/@danieljimgarcia/publishing-static-sites-to-github-pages-using-github-actions-8040f57dfeaf)
- [Using Docker Run inside of GitHub Actions](https://aschmelyun.com/blog/using-docker-run-inside-of-github-actions/)
- [build-push-action](https://github.com/docker/build-push-action?tab=readme-ov-file)
- [Multi-platform image with GitHub Actions](https://docs.docker.com/build/ci/github-actions/multi-platform/)
- [Slack - Github Actions](https://github.com/marketplace/actions/slack-github-actions-slack-integration)
- [Slack - Github Action](https://github.com/marketplace/actions/slack-github-action)
- [Deploy using ArgoCD and Github Actions](https://medium.com/@mssantossousa/deploy-using-argocd-and-github-actions-888f7370e480)


## Setup

### Docker Run for Daux IO

    - name: Generate static Daux webpages
      uses: addnab/docker-run-action@v3
      with:
        image: daux/daux.io:latest
        options: |
          --rm 
          -v ${{ github.workspace }}:/build
          -w /build
        run: /daux/bin/daux generate -s markdown -d docs

addnab/docker-run-action@v3 doesnt support entry point so have to call executible directly

### WebPage Deployment to Git Pages Repo

* Copy files to another repository: adds/updatres docs in docs directory
* github-action-push-to-another-repository: deletes and recreates docs directory

### Webpage Image Creation and Push

### Send Slack message

