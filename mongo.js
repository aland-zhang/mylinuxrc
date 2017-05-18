db.ClusterInfoCollection.find({ _id: "b444bd04-d2c8-4f2a-9084-577731f4bb6c" }).forEach(function (doc) {
	print(doc);
	print(doc.config.master_config[0]);
    // doc.config.master_config.forEach(function (config) {
    //   config.ssh_info="root:i5FvrDsAok0uzWjI2";
    //   config.sudo_info="root:i5FvrDsAok0uzWjI2";
    // });
    // db.ClusterInfoCollection.save(doc);
  });