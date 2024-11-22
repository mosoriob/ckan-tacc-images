### Manage users

To manage users, you can use the [CKAN API](https://docs.ckan.org/en/2.9/api/index.html).

```bash
ckan -c production.ini sysadmin add john_doe
```

### Manage OAuth2 Clients

The following scripts are available to manage OAuth2 clients:

#### Create a Client

To create a new OAuth2 client, use the `create-client.sh` script:

```bash
./scripts/create-client.sh <username> <password> <client-name> <dev-flag>
```

Parameters:

- `username`: Your Tapis username
- `password`: Your Tapis password
- `client-name`: Desired name for the new client
- `dev-flag`: Set to "true" for development environment, "false" for production

Example:

```bash
./scripts/create-client.sh john.doe password123 my-client true
```

#### Get Client Information

To retrieve information about an existing client:

```bash
./scripts/get-client.sh <username> <password> <client-name>
```

Example:

```bash
./scripts/get-client.sh john.doe password123 my-client
```

#### Delete a Client

To delete an existing OAuth2 client:

```bash
./scripts/delete-client.sh <username> <password> <client-name>
```

Example:

```bash
./scripts/delete-client.sh john.doe password123 my-client
```

Note: All these operations require valid Tapis credentials. The scripts will automatically handle JWT token authentication with the Tapis API.
