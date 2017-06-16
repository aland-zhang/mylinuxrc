curl -X POST 'localhost:9200/logstash-test/frequency/' -d ' 
{
  "some_field": "some_value"
}
'

curl -X PUT 'localhost:9200/website/blog/123' -d '
{
  "title": "My first blog entry",
  "text":  "Just trying this out...",
  "date":  "2014/01/01"
}
'

curl -X POST 'localhost:9200/website/blog/' -d '
{
  "title": "My second blog entry",
  "text":  "Still trying this out...",
  "date":  "2014/01/01"
}'

curl -X POST 'localhost:9200/website/blog/' -d '
{
  "title": "My 4th blog entry",
  "text":  "Fuck yousss.",
  "date":  "2014/01/02"
}'


curl -XPOST 'localhost:9200/website/_search?pretty' -d '
{
  "query": { "match": { "text": "Fuck you." } }
}'


curl -XPOST 'localhost:9200/website/_search?pretty' -d '
{
  "query": {
        "bool": {
          "should": [],
          "must_not": [
          	{
              "match": {
                "text": "Fuck you."
              }
            }
          ],
          "must": [
            {
              "match": {
                "text": "clever"
              }
            },
            {
              "match": {
                "text: "console-web-mongo-3980009502-xcwcl"
              }
            }
          ]
        }
      }
}'

curl -XPOST 'localhost:9200/website/_search?pretty' -d '
{
  "query": {
    "bool" : {
      "must" : {
        "term" : { "user" : "kimchy" }
      },
      "filter": {
        "term" : { "tag" : "tech" }
      },
      "must_not" : {
        "range" : {
          "age" : { "gte" : 10, "lte" : 20 }
        }
      },
      "should" : [
        { "term" : { "tag" : "wow" } },
        { "term" : { "tag" : "elasticsearch" } }
      ],
      "minimum_should_match" : 1,
      "boost" : 1.0
    }
  }
}'

curl -XPOST 'localhost:9200/website/_search?pretty' -d '
{
  "query": {
    "bool" : {
      "must" : [
        {"match" : { "text" : "abc" }},
        {"match" : { "text" : "def" }}
      ],
      "must_not" : {
        "match" : {
          "text" : "Fuck you."
        }
      }
    }
  }
}'



curl -X PUT 'localhost:9200/my_index' -d '
{
  "mappings": {
    "my_type": {
      "properties": {
        "full_text": {
          "type":  "text" 
        },
        "exact_value": {
          "type":  "keyword" 
        }
      }
    }
  }
}'

curl -X POST 'localhost:9200/my_index/my_type/' -d '
{
  "full_text":   "Quick Foxes!", 
  "exact_value": "Quick Foxes!"  
}'


curl 'localhost:9200/my_index/my_type/_search' -d '
{
  "query": {
    "term": {
      "exact_value": "Quick Foxes!" 
    }
  }
}'

curl 'localhost:9200/my_index/my_type/_search' -d '
{
  "query": {
    "term": {
      "full_text": "Quick Foxes!" 
    }
  }
}'

curl 'localhost:9200/my_index/my_type/_search' -d '
{
  "query": {
    "term": {
      "full_text": "foxes" 
    }
  }
}'

curl 'localhost:9200/my_index/my_type/_search' -d '
{
  "query": {
    "wildcard": {
      "exact_value": "Quick*" 
    }
  }
}'

curl -X POST 'localhost:9200/logstash-2017.06.12/fluentd/' -d ' 
{
		"log": "[k8s-admin]Started 10.100.49.70:42500 - admin [22/May/2017:11:00:34 +0800] GET /api/v0.2/partitions/test/applications?podInfo=true&predeploy=true&uid=1455699986\n",
        "kubernetes" : {
          "namespace_name" : "kube-system",
          "pod_name" : "canal-44nkz",
          "pod_id" : "b55d51f1-2967-11e7-bfb1-525400d987bd",
          "labels" : {
            "k8s-app" : "canal",
            "pod-template-generation" : "1"
          },
          "host" : "kube-node-22",
          "container_name" : "calico-node"
        },
        "tag" : "kubernetes.var.log.containers.canal-44nkz_kube-system_calico-node-14c5b9e975b6fb4fcb90296189ee5b50d9d0348f3601d878345982c604922a7d.log",
        "time" : "2017/05/18 16:48:26.438"
}'


curl -X POST 'localhost:9200/logstash-test/fluentd/' -d ' 
{
     "log": "[k8s-admin]Started 10.100.49.70:42500 - admin [22/May/2017:11:00:34 +0800] GET /api/v0.2/partitions/test/applications?podInfo=true&predeploy=true&uid=1455699986\n",
     "stream": "stdout",
     "docker": {
       "container_id": "f801f9d321f44824366a3e26aeaec5347c959951ea515c20fa648a2282413f7c"
     },
     "kubernetes": {
       "namespace_name": "caas",
       "pod_name": "kubernetes-admin-2770990362-cp9bv",
       "pod_id": "7bb5e0bd-3ae7-11e7-b5f6-525400d987bd",
       "labels": {
         "pod-template-hash": "2770990362",
         "kubernetes-admin_caicloud_io/application": "kubernetes-admin",
         "kubernetes-admin_caicloud_io/select-by": "service_caas_kubernetes-admin",
         "kubernetes-admin_caicloud_io/type": "application"
       },
       "host": "kube-node-32",
       "container_name": "kubernetes-admin"
     },
     "tag": "kubernetes.var.log.containers.kubernetes-admin-2770990362-cp9bv_caas_kubernetes-admin-f801f9d321f44824366a3e26aeaec5347c959951ea515c20fa648a2282413f7c.log",
     "@timestamp": "2017-05-22T11:00:34+08:00"
}'


curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"time=\"2017-06-13T22:58:05+08:00\" level=info msg=\"[GetNodeListChannel] took 196.135368ms\" \n","stream":"stderr","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:05+08:00"}}'


curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"time=\"2017-06-13T22:58:06+08:00\" level=info msg=\"[quota sum in user namespace] requests.cpu: 153200m, 153200, requests.memory: 235008Mi, 246423748608\\n\" \n","stream":"stderr","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:06+08:00"}]'
'

curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"[k8s-admin]Started 10.100.7.43:57440 - admin [13/Jun/2017:22:58:06 +0800] GET /api/v0.2/partitions/clever?uid=1131094912&quota=true\n","stream":"stdout","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:06+08:00"}
'
curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"time=\"2017-06-13T22:58:06+08:00\" level=error msg=\"ResourceQuota not found for partition default\" \n","stream":"stderr","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:06+08:00"}
'
curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"time=\"2017-06-13T22:58:05+08:00\" level=info msg=\"[GetNamespaceListChannel] took 37.067149ms\" \n","stream":"stderr","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:05+08:00"}
'

curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"time=\"2017-06-13T22:58:05+08:00\" level=info msg=\"[quota sum across the cluster] requests.cpu: 3060m, requests.memory: 2436Mi\\n\" \n","stream":"stderr","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:05+08:00"}
'

curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"[k8s-admin]Started 10.100.7.43:57432 - admin [13/Jun/2017:22:58:06 +0800] GET /api/v0.2/partitions/caas?uid=1131094912&quota=true\n","stream":"stdout","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:06+08:00"}
'
curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"[k8s-admin]10.100.7.43:57436 - admin [13/Jun/2017:22:58:06 +0800] \"GET /api/v0.2/partitions/caicloud?uid=1131094912&quota=true HTTP/1.1\" 200 906 54.515221ms\n","stream":"stdout","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:06+08:00"}
'

curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"[k8s-admin]10.100.7.43:57422 - admin [13/Jun/2017:22:58:05 +0800] \"GET /api/v0.2/clusterQuota?uid=1131094912 HTTP/1.1\" 200 279 281.112778ms\n","stream":"stdout","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:05+08:00"}
'

curl -X POST 'localhost:9200/logstash-test/fluentd' -d '
{"log":"time=\"2017-06-13T22:58:06+08:00\" level=info msg=\"cpu capacity: 342, mem capacity: 672059160Ki, cpu quota(limits): 684, mem quota(limits): 672059160Ki\" \n","stream":"stderr","docker":{"container_id":"95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76"},"kubernetes":{"namespace_name":"default","pod_name":"kubernetes-admin-v1.0.5-1559733660-wzdrg","pod_id":"0d53c0d9-4fda-11e7-a072-52540092af07","labels":{"caicloud-app":"kubernetes-admin","pod-template-hash":"1559733660","version":"v1.0.5","caicloud_io/cluster-service":"true","kubernetes-admin_caicloud_io/application":"kubernetes-admin-v1.0.5","kubernetes-admin_caicloud_io/type":"application"},"host":"kube-node-73","container_name":"kubernetes-admin"},"tag":"kubernetes.var.log.containers.kubernetes-admin-v1.0.5-1559733660-wzdrg_default_kubernetes-admin-95e0c978f1549c740af75aab5e4afa625b38c6131b6f777cfb59fb23c2946e76.log","@timestamp":"2017-06-13T22:58:06+08:00"}
'