```markdown
---
layout: default
title: GitHub Pages Deployment
---

# GitHub Pages Deployment

Welcome to the GitHub Pages Deployment guide! This project will help you understand how to deploy a website using GitHub Pages and Jekyll.

## Prerequisites

Before you begin, make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Jekyll](https://jekyllrb.com/docs/installation/)
- [Bundler](https://bundler.io/)

## Getting Started

1. **Fork the Repository**: Start by forking the repository to your GitHub account.
2. **Clone the Repository**: Clone the forked repository to your local machine.
  ```sh
  git clone https://github.com/your-username/github-pages-deployment.git
  cd github-pages-deployment
  ```
3. **Install Dependencies**: Install the required dependencies using Bundler.
  ```sh
  bundle install
  ```

## Building the Site

To build the site locally, run the following command:
```sh
bundle exec jekyll serve
```
This will start a local server at `http://localhost:4000` where you can preview your site.

## Deploying to GitHub Pages

1. **Commit Your Changes**: Make sure all your changes are committed.
  ```sh
  git add .
  git commit -m "Initial commit"
  ```
2. **Push to GitHub**: Push your changes to the `main` branch of your repository.
  ```sh
  git push origin main
  ```
3. **Enable GitHub Pages**: Go to the repository settings on GitHub, navigate to the "Pages" section, and select the `main` branch as the source.

Your site should now be live at `https://your-username.github.io/github-pages-deployment`.

## Conclusion

Congratulations! You have successfully deployed your Jekyll site using GitHub Pages. For more information, check out the [Jekyll documentation](https://jekyllrb.com/docs/) and the [GitHub Pages documentation](https://docs.github.com/en/pages).

```