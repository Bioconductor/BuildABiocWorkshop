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

## To use the resulting image:

```sh
docker run -e PASSWORD=<choose_a_password_for_rstudio> -p 8787:8787 YOURDOCKERIMAGENAME
```
Once running, navigate to http://localhost:8787/ and then login with `rstudio`:`yourchosenpassword`. 

To try with **this** repository docker image:

```sh
docker run -e PASSWORD=abc -p 8787:8787 ghcr.io/seandavi/buildabiocworkshop
```

*NOTE*: Running docker that uses the password in plain text like above exposes the password to others 
in a multi-user system (like a shared workstation or compute node). In practice, consider using an environment 
variable instead of plain text to pass along passwords and other secrets in docker command lines. 


## Whatcha get

- https://seandavi.github.io/BuildABiocWorkshop
- A Docker image that you can run locally, in the cloud, or (usually) even as a singularity container on HPC systems. 
