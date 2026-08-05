# BuildABiocWorkshop

This package is a template for building a Bioconductor workshop. The package
includes Github actions to:

1. Set up bioconductor/bioconductor_docker:devel on Github resources
2. Install package dependencies for your package (based on the `DESCRIPTION` file)
3. Run `rcmdcheck::rcmdcheck`
4. Build a pkgdown website and push it to github pages
5. Build a docker image with the installed package and dependencies and deploy to [the Github Container Repository](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#pulling-container-images) at the name `ghcr.io/gihub_user/repo_name`, all lowercase. 

## Responsibilities

Package authors are primarily responsible for:

1. Creating a landing site of their choosing for their workshops (a website). This website should be listed in the `DESCRIPTION` file as the `URL`.
2. Creating a docker image that will contain workshop materials and the installed packages necessary to run those materials. The name of the resulting docker image, including "tag" if desired, should be listed in a non-standard tag, `DockerImage:` in the `DESCRIPTION` file. 

Both of those tasks can be accomplished using the Github actions included in this template package. The vignette accompanying this package describes how to accomplish both of these tasks.

## Details

For detailed instructions, see the `How to build a workshop` article/vignette.

## Results of successful deployment

- A working docker image that contains the installed package and dependencies.
- An up-to-date `pkgdown` website at https://YOURUSERNAME.github.io/YOURREPOSITORYNAME/
- Docker image will be tagged with `latest`, `sha-XXXXXX` where `XXXXXX` is the hash of the current `master` commit, and `master`. 

## ⚠️ IMPORTANT: Make Your Docker Image Public on GHCR

> **Your workshop Docker image will NOT be publicly accessible by default.**
>
> GitHub Container Registry (GHCR) sets all newly pushed packages to **private** visibility
> automatically. This means that anyone trying to pull your workshop image — attendees,
> workshop organizers, automated systems — **will get an authentication error** unless you
> explicitly change the visibility to **public**.
>
> This is a manual step that **cannot be automated** through the GitHub Actions workflow in
> this template, because changing package visibility requires owner-level permissions that
> exceed what the `GITHUB_TOKEN` secret can provide.

### How to make your image public

After GitHub Actions successfully pushes your Docker image for the first time:

1. Go to your GitHub profile or organization page
2. Click the **"Packages"** tab
3. Find your workshop package (it will be named after your repository)
4. Click the package name to open it
5. Click **"Package settings"** (bottom right of the package page)
6. Scroll down to the **"Danger Zone"** section
7. Click **"Change visibility"** → select **Public** → confirm

Alternatively, navigate directly to:
```
https://github.com/users/YOUR_USERNAME/packages/container/YOUR_REPO_NAME/settings
```
(or for organizations: `https://github.com/orgs/YOUR_ORG/packages/container/YOUR_REPO_NAME/settings`)

### Why does this matter?

Bioconductor workshops are meant to be open and reproducible. Attendees need to be able to
`docker pull` your image **without** a GitHub account or any authentication. A private image
silently breaks this for everyone. **Make the image public before advertising your workshop.**

### Relevant documentation

- [GitHub Docs: Configuring a package's access control and visibility](https://docs.github.com/en/packages/learn-github-packages/configuring-a-packages-access-control-and-visibility)
- [GitHub Docs: Working with the Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [GitHub Docs: Connecting a repository to a package](https://docs.github.com/en/packages/learn-github-packages/connecting-a-repository-to-a-package)

---

## To use the resulting image:

```sh
docker run -e PASSWORD=<choose_a_password_for_rstudio> -p 8787:8787 YOURDOCKERIMAGENAME
```
Once running, navigate to http://localhost:8787/ and then login with `rstudio`:`yourchosenpassword`. 

To try with **this** repository docker image:

```sh
docker run -e PASSWORD=abc -p 8787:8787 ghcr.io/bioconductor/buildabiocworkshop
```

*NOTE*: Running docker that uses the password in plain text like above exposes the password to others 
in a multi-user system (like a shared workstation or compute node). In practice, consider using an environment 
variable instead of plain text to pass along passwords and other secrets in docker command lines. 


## Whatcha get

- https://bioconductor.github.io/BuildABiocWorkshop
- A Docker image that you can run locally, in the cloud, or (usually) even as a singularity container on HPC systems. 
