gp --namespace=kube-system|grep monitoring-server-v1.0.0|awk '{print $1}'|xargs -I {} echo "you are so smart! {}"
