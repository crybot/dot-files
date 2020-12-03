#!/bin/bash

curl -X POST \
  http://localhost:8087/fsip/rest/v2/oauth/token \
  -H 'Accept: */*' \
  -H 'Authorization: Basic Y2xpZW50OnNlY3JldA==' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Host: localhost:8087' \
  -H 'Postman-Token: b65e784b-40e8-4f40-a943-1619cde68d8d,6de4f619-196d-4fbf-8508-5506cc84923e' \
  -H 'User-Agent: PostmanRuntime/7.13.0' \
  -H 'accept-encoding: gzip, deflate' \
  -H 'cache-control: no-cache' \
  -H 'content-length: 49' \
  -d 'grant_type=password&username=admin&password=admin' \
  | jq -r '.access_token' \
  | xclip
