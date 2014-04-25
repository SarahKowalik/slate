
# PagerDuty credentials

The PagerDuty resource has the following attributes:

Attribute | Type | Description
--- | --- | ---
service_key | String |
subdomain | String |
username | String |
password | String |


## Create pagerduty credentials for a contact

```shell
curl -w 'response: %{http_code} \n' -X POST -H "Content-Type: application/vnd.api+json" -d \
 '{
    "pagerduty_credentials": [
      {
        "service_key" : "",
        "subdomain" : "",
        "username" : "",
        "password" : ""
      }
    ]
  }' \
 http://localhost:3081/contacts/5/pagerduty_credentials
```

```ruby
require 'flapjack-diner'
Flapjack::Diner.base_uri('localhost:3081')

Flapjack::Diner.create_contact_pagerduty_credentials('5',
  {'service_key' => '',
   'subdomain'   => '',
   'username'    => '',
   'password'    => ''})
```

### HTTP Request

`POST /contacts/CONTACT_ID/pagerduty_credentials`

### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
pagerduty_credentials | Array[PagerDuty] | An array of PagerDuty resources to create.

### HTTP Return Codes

Return code | Description
--------- | -----------
201 | The submitted pagerduty credentials resources were created successfully.
405 | **Error** The submitted pagerduty credentials data was not sent with the JSONAPI MIME type `application/vnd.api+json`.
422 | **Error** The submitted pagerduty credentials data did not conform to the provided specification.


## Get pagerduty credentials

If no contact ids are provided then all pagerduty credentials resources will be returned; if contact ids
are provided then only the pagerduty credentials resources matching those ids will be returned.

```shell
curl http://localhost:3081/pagerduty_credentials

# or
curl http://localhost:3081/pagerduty_credentials/1

# or
curl http://localhost:3081/pagerduty_credentials/21,22
```

```ruby
require 'flapjack-diner'
Flapjack::Diner.base_uri('localhost:3081')

Flapjack::Diner.pagerduty_credentials

# or
Flapjack::Diner.pagerduty_credentials('1')

# or
Flapjack::Diner.pagerduty_credentials('21', '22')
```

> The commands return JSON structured like this, which is broken up by Flapjack::Diner into its constituent hashes:

```json
{
  "pagerduty_credentials": [
    {
      "links": {
        "contacts": ["21"]
      },
    }
    },
    {
      "links": {
        "contacts": ["22"]
      },
    }
  ]
}
```

### HTTP Request

`GET /pagerduty_credentials`

**or**

`GET /pagerduty_credentials/CONTACT_ID[,CONTACT_ID,CONTACT_ID...]`

### Query Parameters

None.

### HTTP Return Codes

Return code | Description
--------- | -----------
200 | OK


## Update pagerduty credentials

Update one or more attributes for one or more pagerduty credentials resources.

```shell
curl -w 'response: %{http_code} \n' -X PATCH -H "Content-Type: application/json-patch+json" -d \
'[
  {"op"    : "replace",
   "path"  : "/pagerduty_credentials/0/username",
   "value" : ""},
  {"op"    : "replace",
   "path"  : "/pagerduty_credentials/0/password",
   "value" : ""}
]' \
 'http://localhost:3081/pagerduty_credentials/21s'
```

```ruby
require 'flapjack-diner'
Flapjack::Diner.base_uri('localhost:3081')

Flapjack::Diner.update_pagerduty_credentials('21',
  :username => '',
  :password => '')
```

### HTTP Request

`PATCH /pagerduty_credentials/CONTACT_ID[,CONTACT_ID,CONTACT_ID...]`

### Query Parameters

Parameters sent for pagerduty credentials updates must form a valid [JSON Patch (RFC 6902)](http://tools.ietf.org/html/rfc6902) document. This is comprised of a bare JSON array of JSON-Patch operation objects, which have three members:

Parameter | Type | Description
--------- | ---- | -----------
op | String | may only be *replace*
path | String | "/pagerduty_credentials/0/ATTRIBUTE" (e.g. 'username')
value | -> | a value of the correct data type for the attribute in the path

### HTTP Return Codes

Return code | Description
--------- | -----------
204 | The submitted pagerduty credentials updates were made successfully. No content is returned.
404 | Pagerduty credentials resources could not be found for one or more of the provided contact ids. No pagerduty credentials resources were altered by this request.
405 | **Error** The submitted pagerduty credentials data was not sent with the JSONAPI MIME type `application/vnd.api+json`.


## Delete pagerduty credentials

Delete one or more pagerduty credentials resources.

```shell
curl -w 'response: %{http_code} \n' -X DELETE \
  'http://localhost:3081/pagerduty_credentials/11'

# or
curl -w 'response: %{http_code} \n' -X DELETE \
  'http://localhost:3081/pagerduty_credentials/31,32'
```

```ruby
require 'flapjack-diner'
Flapjack::Diner.base_uri('localhost:3081')

Flapjack::Diner.delete_pagerduty_credentials('11')

# or
Flapjack::Diner.delete_pagerduty_credentials('31', '32')
```

### HTTP Request

`DELETE /pagerduty_credentials/CONTACT_ID[,CONTACT_ID,CONTACT_ID...]`

### Query Parameters

None.

### HTTP Return Codes

Return code | Description
--------- | -----------
204 | The pagerduty credentials resources were deleted
404 | Pagerduty credentials could not be found for one or more of the provided contact ids. No pagerduty credentials were deleted by this request.
