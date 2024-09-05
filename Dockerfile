FROM alpine:3.20

WORKDIR /tmp

# Install Applications
RUN apk update && apk add --no-cache git go python3 py3-pip pipx wget unzip curl rust cargo make

ENV PATH="/root/.local/bin:$PATH"

# Install Pip packages
ENV POETRY_VERSION=1.8.0
RUN pipx install poetry==${POETRY_VERSION}
# ENV CHECKOV_VERSION=3.2.245
# RUN pipx install checkov==${CHECKOV_VERSION}

# Install Terraform
ENV TERRAFORM_VERSION=1.9.5
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install Terraform Docs
ENV TERRAFORM_DOCS_VERSION=0.18.0
RUN curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname)-amd64.tar.gz && \
    tar -xzf terraform-docs.tar.gz && \
    chmod +x terraform-docs && \
    mv terraform-docs /usr/local/bin/terraform-docs && \
    rm terraform-docs.tar.gz

# Install Infra Cost
ENV INFRA_COST_VERSION=0.10.39
RUN curl -Lo ./infracost-linux-amd64.tar.gz https://github.com/infracost/infracost/releases/download/v${INFRA_COST_VERSION}/infracost-linux-amd64.tar.gz && \
    tar -xzf infracost-linux-amd64.tar.gz  && \
    mv infracost-linux-amd64 /usr/local/bin/infracost && \
    rm infracost-linux-amd64.tar.gz

RUN rm -r /tmp
WORKDIR /app

# Default to the shell
CMD [ "/bin/sh" ]
