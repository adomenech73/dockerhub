datasources: {
    influxdb: {
      type: 'influxdb',
      url: "http://yourpublicIP:8086/db/exampledb",
      username: 'root',
      password: 'root',
    },
    grafana: {
      type: 'influxdb',
      url: "http://yourpublicIP:8086/db/grafana",
      username: 'root',
      password: 'root',
      grafanaDB: true
    },
  },