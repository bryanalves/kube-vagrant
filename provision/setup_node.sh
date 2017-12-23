#!/bin/bash

kubeadm join --token $(< /vagrant/token) 192.168.60.10:6443 --discovery-token-ca-cert-hash sha256:$(< /vagrant/ca.sha)
