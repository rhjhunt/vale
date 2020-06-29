# vale container

![Docker Image CI](https://github.com/rhjhunt/vale/workflows/Docker%20Image%20CI/badge.svg)

Container for vale built on Fedora.

## Pull

You can pull from Quay.io:

```terminal
podman pull quay.io/rhjhunt/vale

You can also build your own:

```terminal
git clone https://github.com/rhjhunt/vale.git
cd vale 
buildah bud -t vale .
```

## Run

You can run the container interactively with the following command.

```terminal
podman run --rm -it --volume "${HOME}:${HOME}:rslave" --env "HOME=${HOME}" --security-opt label=disable --workdir "$(pwd)" quay.io/rhjhunt/vale:latest
```

Or create an alias in your _~/.bashrc_ file.

```bash
alias vale='podman run --rm -it \
        --volume "${HOME}:${HOME}:rslave" \
        --env "HOME=${HOME}" \
        --security-opt label=disable \
        --workdir "$(pwd)" \
        --entrypoint /usr/bin/vale \
        quay.io/rhjhunt/vale:latest'
```
