curl -XPOST 'localhost:9200/logstash-2016.08.17/_search?pretty' -d '
{
  "query": {
    "bool": {
      "must": [
        { "match": { "log": "haoyuan" } },
        { "match": { "namespace_name": "log2" } }
      ]
    }
  }
}'

curl 'localhost:9200/logstash-2016.08.19/_search?q=*&pretty'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.17/_search?pretty' -d '
{
  "query": { "match": { "type": "elasticsearch" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.21/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'


curl -XPOST 'localhost:9200/logstash-2016.08.17/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "message": "nininini" } }
}'


curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match_all": {} }
}'


curl 'localhost:9200/_cat/indices?v'
curl 'elasticsearch-logging.kube-system:9200/_mapping?pretty'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.data" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.*.log" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.*.log" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "message": "caonima" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "prefix": { "tag": "file" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "prefix": { "tag": "file" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.synthetic-dates.log" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "log": "niurou" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file." } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "message": "world" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "message": "ubuntu" } }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "prefix": { "container_name": "mongo" } }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "p2" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "namespace_name": "p2" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "from": 0,
  "size": 200,
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "namespace_name": "p2"
              }
            },
            {
              "wildcard": {
                "pod_name": "logs-4051901663-vtjo1"
              }
            },
            {
              "wildcard": {
                "container_name": "conmongo"
              }
            },
            {
              "query_string": {
                "query": "coolest",
                "analyze_wildcard": true
              }
            }
          ]
        }
      },
      "filter": {
            "range": {
              "@timestamp": {
                "gte": "2016-08-20",
                "lte": "2016-08-20"
              }
            }
          }
        }
      },
      "sort": {
        "@timestamp": {
          "order": "desc"
        }
      },
      "highlight": {
        "pre_tags": [
          "<logHighlight>"
        ],
        "post_tags": [
          "</logHighlight>"
        ],
        "fields": {
          "log": {}
        }
      }
    }
  }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "size": 0,
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "kubernetes.namespace_name": "default"
              }
            },
            {
              "wildcard": {
                "kubernetes.pod_name": "cluster-admin-8m13t"
              }
            }
          ]
        }
      }
    }
  },
  "aggs": {
    "group_by_containername": {
      "terms": {
        "field": "kubernetes.container_name"
      }
    }
  },
  "sort": {
    "container_name": {
      "order": "asc"
    }
  }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "size": 0,
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "namespace_name": "default"
              }
            },
            {
              "wildcard": {
                "pod_name": "auth-mongo-fp9dk"
              }
            }
          ]
        }
      }
    }
  },
  "aggs": {
    "group_by_containername": {
      "terms": {
        "field": "container_name"
      }
    }
  },
  "sort": {
    "container_name": {
      "order": "asc"
    }
  }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"message": "baidu" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"message": "woyou" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"message": "loveyou" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "log2"} }
}'



curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "kube-system"} }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"kubernetes.namespace_name": "kube-system"} }
}'

 curl -XDELETE 'http://elasticsearch-logging.kube-system:9200/logstash-2016.08.20/' 