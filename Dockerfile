FROM registry.access.redhat.com/ubi8-minimal:latest

LABEL   name="vale" \
        version="2.10.4" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="A syntax-aware linter for prose built with speed and extensibility in mind." \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave --env HOME=${HOME} \
             --workdir $(pwd) --security-opt label=disable quay.io/rhjhunt/vale:latest"

RUN echo -e "[ruby]\nname=ruby\nstream=2.7\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/ruby.module && \
    microdnf -y --nodocs update && \
    microdnf -y --nodocs install ruby ruby-devel && \
    microdnf clean all  && \
    rm -rf /var/cache/yum && \
    gem install --no-document asciidoctor

COPY vale /bin/

ENTRYPOINT ["/bin/vale"]
CMD ["--help"]
