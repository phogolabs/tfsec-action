FROM aquasec/tfsec-ci:v0.58

ARG APP_VERSION "0.58"
ARG APP_NAME "TfSec Scanner"
ARG APP_DESCRIPTION "Scan your Terraform code for vulnerabilities with TfSec"
ARG APP_SOURCE "https://github.com/phogolabs/tfsec-action"

LABEL com.github.actions.name $APP_NAME
LABEL com.github.actions.icon "check"
LABEL com.github.actions.color "green"
LABEL com.github.actions.description $APP_DESCRIPTION

LABEL org.opencontainers.image.title $APP_NAME
LABEL org.opencontainers.image.version $APP_VERSION
LABEL org.opencontainers.image.description $APP_DESCRIPTION
LABEL org.opencontainers.image.source $APP_SOURCE

USER root
# enable the entry point
COPY main.sh /usr/bin/main
# make sure that the entry point has the correct attributes
RUN chmod +x /usr/bin/main
# rootless
USER nobody

ENTRYPOINT ["/usr/bin/main"]
