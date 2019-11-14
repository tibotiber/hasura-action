FROM alpine:latest

LABEL repository="https://github.com/tibotiber/hasura-action"
LABEL homepage="https://github.com/tibotiber/hasura-action"
LABEL maintainer="Thibaut Tiberghien <thibaut@smplrspace.com>"

LABEL com.github.actions.name="GitHub Action for Hasura"
LABEL com.github.actions.description="Wraps the hasure CLI to enable common commands."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="gray-dark"

RUN apk add --no-cache curl bash
RUN curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | bash

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]