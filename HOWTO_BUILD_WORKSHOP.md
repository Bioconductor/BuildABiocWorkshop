
## Quickstart

- [ ] Clone this repo, fork and rename it, or create a repo from this template
- [ ] Edit `DESCRIPTION` file
  - [ ] Change package name
  - [ ] Change title and description
  - [ ] Change authors
  - [ ] Check dependencies
  - [ ] Change DockerImage tag
- [ ] Edit `.github/workflows/basic_checks.yaml`
- [ ] Write a normal R package that can be installed
- [ ] Include one or more vignettes that will constitute the workshop materials

## Details

### Clone this repo

```
git clone https://github.com/seandavi/BuildABiocWorkshop2020 MYPKGDIR
```

### Edit `DESCRIPTION` file

- Change the package name to something identifiable and descriptive, ideally 
something that will be somewhat unique. 
- Edit the title and description as per any normal R package.
- Update authors (unless you want me to get credit for your work).
- Workshop packages are normal R packages, so dependencies work as usual. If
you are going to depend on something on github, be sure to specify the correct
repo `username/reponame`. Installation will deal with this.

### Edit `.github/workflows/basic_checks.yaml`

**You MUST change the `repository` line in this yaml file to be YOUR 
desired Docker image name**. In other words, this section of the github
actions file will build and push to dockerhub the image with this name.


```yaml
     - uses: docker/build-push-action@v1
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
          # change the next line to reflect the name
          # of YOUR dockerhub repository
          repository: seandavi/buildabiocworkshop2020
          tag_with_ref: true
          tag_with_sha: true
          tags: latest
```

### Add "secrets" to github repo
 
- required secrets and their names

- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- Github `ACCESS_TOKEN`

