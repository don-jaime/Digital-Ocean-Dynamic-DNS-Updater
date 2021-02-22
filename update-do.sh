if [[ -z "$DOMAIN_NAME" ]]; then
  echo Expected environment variable DOMAIN_NAME.
  exit -1
fi

if [[ -z "$RECORD_ID" ]]; then
  echo Expected environment variable RECORD_ID.
  exit -1
fi

if [[ -z "$DO_TOKEN" ]]; then
  echo Expected environment variable DO_TOKEN.
  exit -1
fi

IP_ADDRESS=`curl -s http://ipaddr.io/ip`

curl -s -X PUT https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records/$RECORD_ID \
  -H "Authorization: Bearer $DO_TOKEN" \
  -H "Content-Type: application/json" \
  --data "{\"data\":\"$IP_ADDRESS\"}"
