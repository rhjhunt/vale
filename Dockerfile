FROM registry.fedoraproject.org/fedora-minimal:latest

LABEL   name="vale" \
        version="1.0" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="A syntax-aware linter for prose built with speed and extensibility in mind." \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave --env HOME=${HOME} \
             --workdir $(pwd) --security-opt label=disable quay.io/rhjhunt/vale:latest"

RUN microdnf -y --nodocs update && \
    microdnf clean all  && \
    rm -rf /var/cache/yum 

COPY /vale /bin

CMD ["/bin/bash"]
