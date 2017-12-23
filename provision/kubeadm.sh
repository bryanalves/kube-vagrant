apt-get update && apt-get install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update

apt-get install -y kubelet kubeadm kubectl

swapoff -a

cat << EOF > /etc/systemd/system/kubelet.service.d/09-node_ip.conf
[Service]
Environment="KUBELET_EXTRA_ARGS=--node-ip=$1"
EOF

systemctl daemon-reload
