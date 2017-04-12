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

curl -XPOST 'localhost:9200/logstash-2016.09.13/_search?pretty' -d '
{
  "query": { "match": { "log": "120611_BcGNNoZzgraUtrxjDQRIWkIShEcRfHJWKQgEgzcyCYOVFWpbUbfHJOOsJkmymlaL\n" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.09.13/_search?pretty' -d '
{
  "query": { "match": { "pod_name": "logs5000new" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.21/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'


curl -XPOST 'localhost:9200/logstash-2016.08.17/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.09.12/_search?pretty' -d '
{
  "query": { "match": { "log": "9_QqPRxzPZoHFWMSJsRrgpifaavGdgITTMQQhdSQQEQUrsOCkxKmoqQQgZAKOmniqm" } }
}'


curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": { "match_all": {} }
}'

  "query": { "match_all": {} }
curl -XPOST 'elasticsearch-logging:9200/logstash-*/_search?pretty' -d '
{
  "query": { "match": {"kubernetes.namespace_name":"*"} }
}'

curl -XPOST 'localhost:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": {"kubernetes.namespace_name":"loggen"} }
}'
curl -XPOST 'localhost:9200/logstash-2016.09.08/_search?pretty' -d '
{
  "query": {
    "match_all": {}
  },
  "sort": [
    {
      "_timestamp": {
        "order": "desc"
      }
    }
  ]
}'

curl -XPOST 'localhost:9200/logstash-2016.09.08/_search?pretty' -d '
{
  "query": {
    "match": {"tag": "kubernetes.home.pao.test.l5000_t10s.log"}}
  },
  "sort": [
    {
      "_timestamp": {
        "order": "desc"
      }
    }
  ]
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

curl -XPOST 'localhost:9200/logstash-2016.09.09/_search?pretty' -d '
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

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": { "message": "ubuntu" } }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "prefix": { "container_name": "mongo" } }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "p2" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": { "namespace_name": "p2" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
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

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-*/_search?pretty' -d '
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
                "kubernetes.namespace_name": "micosvc"
              }
            },
            {
              "wildcard": {
                "kubernetes.pod_name": "config-service-1412617049-1miqp"
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

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
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


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": {"message": "baidu" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": {"message": "woyou" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": {"message": "loveyou" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "log2"} }
}'



curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "kube-system"} }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.09.09/_search?pretty' -d '
{
  "query": { "match": {"kubernetes.namespace_name": "kube-system"} }
}'
curl -XDELETE 'localhost:9200/logstash-*/_query' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "loggen"} }
}'
curl -XDELETE 'localhost:9200/logstash-*/_query' -d '
{
  "query": { "match": { "tag": "kubernetes.home.ubuntu.test.l5000_20s.log"} }
}'

curl -XDELETE 'http://elasticsearch-logging.kube-system:9200/logstash-2016.09.08/'
 curl -XDELETE 'http://localhost:9200/logstash-2016.09.10/'


 curl -XPUT 'http://localhost:9200/twitter/tweet/1' -d '{
     "user" : "kimchy",
     "post_date" : "2009-11-15T14:12:12",
     "message" : "trying out Elasticsearch"
 }'
