#!/bin/sh

kubeadm init --config=/vagrant/kubeadm.conf

cp /etc/kubernetes/admin.conf /vagrant/kube.cfg
openssl x509 -in /etc/kubernetes/pki/ca.crt -pubkey --noout | openssl rsa -pubin -outform der 2>/dev/null | sha256sum | awk '{print $1}' > /vagrant/ca.sha
kubeadm token list | tail -1 | awk '{print $1}' > /vagrant/token
