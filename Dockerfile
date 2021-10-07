FROM aquasec/tfsec-ci:v0.58

USER root
# enable the entry point
COPY main.sh /usr/bin/main
# make sure that the entry point has the correct attributes
RUN chmod +x /usr/bin/main
# rootless
USER nobody

ENTRYPOINT ["/usr/bin/main"]
