## Deploy Kubernetes Cluster using RKE2Spray

To deploy a kubernetes cluster with rke2 please follow:

1. Make sure that ansible is already installed on your host or your server

```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

2. Make sure that you can ssh to root user on destination ip without entering password 

```bash
ssh-copy-id root@<SERVER-IP>
```

3. You need to generate a host file for ansible to read hosts from it.So run:

```bash
chmod +x inventory/host-generator.sh
```

then

```bash
./inventory/host-generator.sh
```

follow the structure and generate the host file in `inventory` directory.

4. Last step to deploy your kubernetes cluster is here:

```bash
ansible-playbook -i inventory/hosts playbooks/rke2-playbook.yml
```

## Adding one or more worker to the running rke2 cluster


1. You need to generate another host file using:

```bash
chmod +x inventory/new-host-generator.sh
```

then

```bash
./inventory/new-host-generator.sh
```

follow the structure and generate the host file in `inventory` directory.

2. Run the following command to add workers to the running rke2 cluster:

```bash
ansible-playbook -i inventory/new-hosts playbooks/new-worker-playbook.yml
```

Done

## Accessing the cluster

A kubernetes config file will be automatically generated in
`.kube` in your home directory. So just run `kubectl` command like below:

```bash
kubectl <command>
```

like:

```bash
kubectl get nodes
```
