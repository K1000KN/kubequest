

## Configuration du Cluster Kind

### Installer kind sur votre ordinateur

```
https://github.com/kubernetes-sigs/kind
```

### Créez un cluster KinD

```bash
kind create cluster --name <clustername> --config <config-file>
```

```bash
kind create cluster --name kubequest --config .kind/config/kind-config.yaml
```

### Detruire un Cluster KinD

```bash
kind create cluster --name <clustername>
```

```bash
kind create cluster --name kubequest
```

### Chargement d'une Image Docker dans le cluster KinD

Chargez une image Docker spécifique sur tous les noeud du cluster Kind

```bash
kind load docker-image <name:tag> --name <clustername>
```

il faut build l'image docker avant de l'importer dans le cluster

```bash
docker build -t sample-app:latest .
```

```bash
kind load docker-image sample-app:latest --name kubequest
```

### Installation de Helm

```bash
https://helm.sh/docs/intro/install/
```

### Command helm


init un helm chart
```bash
helm create <chart-name>
```

```bash
helm create kubequest
```

installer le helm chart dans le cluster
```bash
helm install <chart-name> <directory-path>
```

```bash
cd ./K8S/chart/kubequest/
```

installer le helm chart
```bash
helm install kubequest ./kubequest/
```

mettre a jour le helm chart apres modification

```bash
helm upgrade kubequest ./kubequest/
```

```bash
helm dep update
helm dependency build
```

Rechercher une version disponible de chart
```bash
helm search repo prometheus-community/kube-prometheus-stack --versions
```

### Monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```


### Command Kubernetes utile 

se connecter dans le pod
```bash
kubectl exec -it <pod-name> -- /bin/bash
```

lister les variable d'environnement
```bash
env
```

rendre le service accessible depuis l'exterieur
```bash
kubectl port-forward svc/kubequest-mysql 3306:3306
```

se connecter depuis son pc a la base de donnée
```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```


### lancement du projet en local

```bash
kind create cluster --name kubequest --config ./kind/config/kind-config.yaml
```

```bash
kind load docker-image sample-app:latest --name kubequest
```

```bash
helm install kubequest ./chart/kubequest/
```

## Déploiement de Prometheus et Grafana


```bash
kubectl -n  port-forward prometheus-prom-kube-prometheus-stack-prometheus-0  9090:9090
```

```bash
kubectl -n  port-forward deployment/prom-grafana 3000:3000
```

mot de passe grafana: prom-operator 










