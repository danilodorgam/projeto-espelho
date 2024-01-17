# K8s kubetools

This project aims to provide an environment with the following tools:

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [java JDK 21](https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/downloads-list.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [helm](https://helm.sh/docs/topics/charts/)

## Requirements

- Put the config file for your k8s connection in the /kube folder
- Clone the java project you want to work on

## build

```bash
docker build --no-cache -t danilodorgam/k8s-kubetools .
```

## run

Run the command in the java project folder you want to use terminal

```bash
docker run --dns=8.8.8.8 -v /var/run/docker.sock:/var/run/docker.sock -v ./kube:/app/.kube -v $(pwd):/app -w /app -it danilodorgam/k8s-kubetools
```

# links
- https://github.com/danilodorgam/projeto-espelho