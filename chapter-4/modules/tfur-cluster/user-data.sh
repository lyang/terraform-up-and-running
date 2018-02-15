#!/bin/bash

cat > index.html <<EOF
<h1>Hello, ${env} World</h1>
EOF

nohup busybox httpd -f -p "${web-port}" &
