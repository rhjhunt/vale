FROM registry.access.redhat.com/ubi9-minimal

LABEL   name="vale" \
        version="3.3.1" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="A syntax-aware linter for prose built with speed and extensibility in mind." \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave --env HOME=${HOME} \
             --workdir $(pwd) --security-opt label=disable quay.io/rhjhunt/vale:latest"

RUN microdnf install -y --setopt install_weak_deps=0 --nodocs ruby ruby-devel python3-docutils && \
    microdnf clean all --enablerepo='*' && \
    gem install --no-document asciidoctor

COPY vale /bin/

ENTRYPOINT ["/bin/vale"]
CMD ["--help"]
