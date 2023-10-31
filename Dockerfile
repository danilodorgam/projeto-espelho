FROM docker:dind

RUN apk update && apk add --no-cache curl bash openssl  git

WORKDIR /app

#HELM

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

#KUBECTL

RUN    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod u+x kubectl && mv kubectl /bin/kubectl
RUN ln -s /app/.kube  $HOME/.kube

#JAVA

RUN wget -O /etc/apk/keys/amazoncorretto.rsa.pub  https://apk.corretto.aws/amazoncorretto.rsa.pub
RUN echo "https://apk.corretto.aws/" >> /etc/apk/repositories
RUN apk update
RUN apk add amazon-corretto-21

CMD ["bash"]
