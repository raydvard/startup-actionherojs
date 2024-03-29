'use strict'
const fs = require('fs');

exports.default = {
  servers: {
    socket: (api) => {
      return {
        enabled: true, //(process.env.ENABLE_TCP_SERVER !== undefined),
        // TCP or TLS?
        secure: true,
        // Passed to tls.createServer if secure=true. Should contain SSL certificates
        serverOptions: {
          key: fs.readFileSync('certs/private-key.pem'),
          cert: fs.readFileSync('certs/server.pem')
        },
        // Port or Socket
        port: 5000,
        // Which IP to listen on (use 0.0.0.0 for all)
        bindIP: '0.0.0.0',
        // Enable TCP KeepAlive pings on each connection?
        setKeepAlive: false,
        // Delimiter string for incoming messages
        delimiter: '\n',
        // Maximum incoming message string length in Bytes (use 0 for Infinite)
        maxDataLength: 0
      }
    }
  }
}

exports.test = {
  servers: {
    socket: (api) => {
      return {
        enabled: true,
        port: 15000 + parseInt(process.env.JEST_WORKER_ID || 0),
        secure: false
      }
    }
  }
}
