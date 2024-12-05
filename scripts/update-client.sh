#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 username password client-name dev-flag"
    exit 1
fi

USERNAME=$1
PASSWORD=$2
CLIENT_NAME=$3
CALLBACK_URL=$4

# Get JWT token
echo "Getting JWT token..."
JWT=$(curl -s -H "Content-type: application/json" \
    -d "{\"username\": \"$USERNAME\", \"password\": \"$PASSWORD\", \"grant_type\": \"password\" }" \
    https://portals.tapis.io/v3/oauth2/tokens | jq -r '.result.access_token.access_token')

if [ -z "$JWT" ] || [ "$JWT" = "null" ]; then
    echo "Failed to get JWT token. Please check your credentials."
    exit 1
fi


# Update client
echo "Updating client... ${CLIENT_NAME}"

RESPONSE=$(curl -s -X PUT -H "X-Tapis-Token: $JWT" \
    -H "Content-type: application/json" \
    -d "{\"callback_url\": \"$CALLBACK_URL\"}" \
    "https://portals.tapis.io/v3/oauth2/clients/${CLIENT_NAME}")

echo "Response:"
echo $RESPONSE | jq '.'
