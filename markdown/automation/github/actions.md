# Git Actions

## Resources

- [Copy files to another repository](https://github.com/marketplace/actions/copy-files-to-another-repository)
- [Deploying static sites to GitHub Pages using GitHub Actions](https://medium.com/@danieljimgarcia/publishing-static-sites-to-github-pages-using-github-actions-8040f57dfeaf)
- [Using Docker Run inside of GitHub Actions](https://aschmelyun.com/blog/using-docker-run-inside-of-github-actions/)

## Setup

### Docker Run

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