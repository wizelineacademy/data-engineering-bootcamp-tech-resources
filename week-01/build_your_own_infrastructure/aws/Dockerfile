FROM amazon/aws-cli
ARG TERRAFORM_VERSION

RUN yum install unzip -y && yum install wget -y
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version
ENV PATH=~/.local/bin:$PATH

CMD ["bash"]