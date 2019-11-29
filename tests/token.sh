# ```
# UCP_URL=ucp.example.com
# USERNAME=admin
# PASSWORD=supersecretadminpassword
# curl -sk -d "{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\"}" https://${UCP_URL}/auth/login | jq -r .auth_token > auth-token
# ```

NAMESPACE=kubesphere-system
UCP_URL=localhost:

kubectl get ns $NAMESPACE -o json > ./tests/temp/${NAMESPACE}.json

curl -k -H "Content-Type: application/json" -X PUT --data-binary @tests/temp/$NAMESPACE.json http://127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize