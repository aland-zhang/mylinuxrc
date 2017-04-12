curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "kubernetes.namespace_name": "storage-1481165192"
              }
            },
            {
              "wildcard": {
                "kubernetes.pod_name": "fileserver-4164871218-ecllc"
              }
            }
          ]
        }
      }
    }
  }
  
}'

  "query": { "match": { "kubernetes.pod_name": "hadoop-journalnode-0" } }
curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "aggs": {
    "group_by_podname": {
      "terms": {
        "field": "kubernetes.host"
      }
    }
  },
  "sort": {
    "host": {
      "order": "asc"
    }
  }
}'

curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "aggs": {
    "group_by_podname": {
      "terms": {
        "field": "kubernetes.pod_name"
      }
    }
  },
  "sort": {
    "pod_name": {
      "order": "asc"
    }
  }
}'


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

curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "bool": {
      "must": [
        { "match": { "kubernetes.namespace_name": "default" } }
      ]
    }
  }
}'