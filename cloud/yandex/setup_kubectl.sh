#!/usr/bin/env bash
set -Eeuxo pipefail

domain="${1:-$(terraform output -raw domain)}"
cloud_id="${2:-$(terraform output -raw cloud_id)}"
folder_id="${3:-$(terraform output -raw folder_id)}"
cluster_id="${4:-$(terraform output -raw cluster_id)}"
user="${5:-$(terraform output -raw bastion_user)}"

bastion_domain="bastion.${domain}"
master_domain="master.${domain}"
bastion_ssh="${user}@${bastion_domain}"

# I have to execute that script remotely because `yc` can set credentials only
# by using internal IP or external IP, and I refuse to give the master external IP
ssh "${bastion_ssh}" "bash -s" -- <"./setup_kubectl_remote.sh" \
    "${cloud_id}"                                              \
    "${folder_id}"                                             \
    "${cluster_id}"

credentials="Credentials/yc"
ca="${credentials}/${cluster_id}-ca.pem"
token="${credentials}/${cluster_id}-token-admin.txt"

# copy credentials that the remote script has generated to the local machine
scp "${bastion_ssh}:~/${token}" \
    "${bastion_ssh}:~/${ca}"    \
    "${HOME}/${credentials}/"

# setup kubeconfig using those credentials
kubectl config set-cluster "${cluster_id}" \
  --certificate-authority="${HOME}/${ca}"  \
  --server="https://${master_domain}"      \
  --tls-server-name="kubernetes"

set +x
kubectl config set-credentials admin-user --token="$(<"${HOME}/${token}")"
set -x

kubectl config set-context "${cluster_id}" \
  --cluster="${cluster_id}"                \
  --user=admin-user

# check connectivity
kubectl config use-context "${cluster_id}"
kubectl cluster-info