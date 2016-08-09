curl --request POST -i -H "Content-Type: application/json" -d '{"kind": "ClusterRole", 
"apiVersion": "rbac.authorization.k8s.io/v1alpha1", "metadata": {"name": "pod-reader"}, 
"rules": [{ "verbs": ["get", "list", "watch"], "resources": ["pod"] }]}' localhost:8080/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles

curl --request POST -i -H "Content-Type: application/json" -d '{
  "kind": "ClusterRoleBinding",
  "apiVersion": "rbac.authorization.k8s.io/v1alpha1",
  "metadata": {
    "name": "read-pods"
  },
  "subjects": [
    {
      "kind": "User",
      "name": "tester"
    }
  ],
  "roleRef": {
    "kind": "ClusterRole",
    "name": "pod-reader",
    "apiVersion": "rbac.authorization.k8s.io/v1alpha1"
  }
}' localhost:8080/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings


HTTP/1.1 201 Created
Content-Length: 540
Content-Type: application/json
Date: Fri, 08 Jul 2016 20:37:03 GMT

{
  "kind": "ClusterRole",
  "apiVersion": "rbac.authorization.k8s.io/v1alpha1",
  "metadata": {
    "name": "view",
    "selfLink": "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/view",
    "uid": "ba8613cc-454b-11e6-b2ea-42010a800002",
    "resourceVersion": "296840",
    "creationTimestamp": "2016-07-08T20:37:03Z"
  },
  "rules": [
    {
      "verbs": [
        "get",
        "list",
        "watch"
      ],
      "attributeRestrictions": null,
      "apiGroups": null,
      "resources": [
        "pod"
      ]
    }
  ]
}