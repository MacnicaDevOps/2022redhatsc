From ubuntu:22.04
RUN apt-get update && apt-get install -y python3 wget curl jq ssh git
## Install aws cli
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python3 get-pip.py
RUN pip install awscli
## Install latest docker
RUN wget -qO- https://get.docker.com/ | sh
## Install gcloud cli
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install -y apt-transport-https ca-certificates gnupg
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install -y google-cloud-sdk
RUN apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
## Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl && cp /usr/local/bin/kubectl /usr/local/bin/oc
RUN echo 'alias oc="kubectl"' >> ~/.bashrc
RUN echo 'source ~/.bashrc' >> ~/.bash_profile