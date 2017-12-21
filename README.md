# kube-vagrant

This uses [kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/) and [vagrant](https://www.vagrantup.com/) to create a multi-node kubernetes cluster.

This is intended to fill the gap between [minikube](https://github.com/kubernetes/minikube), which is only suited to single node clusters, and more sophisticated offerings

# Usage

    vagrant up
    ./kubectl get nodes

After creating, kube.cfg will have configuration to use via [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/).  If you want to copy this config to `$HOME/.kube/config`, you can.  A kubectl wrapper is provided so that you can start interacting immediately.

# Assumptions

* You want the latest version of kubernetes
* Virtualbox is your VM manager
* 192.168.60.0/24 is a usable subnet
