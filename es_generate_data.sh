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
  "title": "My third blog entry",
  "text":  "Fuck you.",
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

curl -X PUT 'localhost:9200/my_index/my_type/1' -d '
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
