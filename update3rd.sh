curl -H 'Content-Type: application/json' -X PUT --data @body.json http://127.0.0.1:8001/apis/testcaicloud.io/v1alpha1/namespaces/default/zookeeperclusters/etcd-cluster
{
   "apiVersion":"testcaicloud.io/v1alpha1",
   "kind":"ZookeeperCluster",
   "metadata":{
      "name":"etcd-cluster",
      "namespace":"default",
      "selfLink":"/apis/testcaicloud.io/v1alpha1/namespaces/default/zookeeperclusters/etcd-cluster",
      "uid":"2596f01a-bafb-11e6-865a-0800274a55b6",
      "resourceVersion":"5988350",
      "creationTimestamp":"2016-12-05T14:57:31Z"
   },
   "spec":{
      "size":5,
      "version":"v3.1.0-alpha.1"
   }
}