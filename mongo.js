db.ClusterInfoCollection.find({ _id: "ID" }).forEach(function (doc) {
    doc.config.node_config.forEach(function (config) {
      config.ssh_info="newssh";
      config.sudo_info="newssh";
    });
    db.ClusterInfoCollection.save(doc);
  });