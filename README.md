# signature gen app  (middleware For APIs)

Uses middlewares to generate a signature for an api request (starting with default Walmart's api, enum in signature connector class model) 
Uses Escher - Stateless HTTP Request Signing, the only 3rd party gem used, with a Signature class middleware for the rack request & and enum values for the various
different connection types ie walmart, aws, other apis etc in SignatureConnector class, add more apis as needed.

[http://escherauth.io/index.html]

###### Then uses the Signature class to generate a signature for the request, and adds it to the request header, required in config.ru

#### Relevant files/classes x 7, should work also in Rails 5/6

1. Escher.rb (lib/middleware/escher.rb) classes  Escher::Auth - Escher::Keypool - Escher::Signature - Escher::Timestamp - Escher::Util
2. Signature.rb  (lib/middleware/signature.rb
3. Signature.rb (app/models/signature.rb) relation only no code as yet. 
4. SignatureConnector.rb  (app/models/signature_connector.rb)  enums for the different connection types, belongs the signature class.
5. 2 x migrations (app/models/migrations/signature_connector.rb & app/models/migrations/signature.rb)
6. require_relative 'signature' in config.ru

#### Gems 'escher-rack_middleware'  in Gemfile.

## Concept: (in progress) 
1. Escher for signature/timestamp 
2. Signature class for request 
3. SignatureConnector for the various api connections
###### these may be needed in addition to Walmart which can be added to the SignatureConnector class enum hash

##### Connection examples (walmart) not yet implemented
connection = SignatureConnector.new
connection -> {
SignatureConnector.connection
}
connection = SignatureConnector.new(connection_type: 'aws')
connection = SignatureConnector.new(connection_type: 'walmart', WM_SEC.AUTH_SIGNATURE: 'wm_sec_auth_signature', WM_SEC.TIMESTAMP 'wm_secure_timestamp')

Needs fleshing out and finishing, should be relatively straighforward for multiple people to work on and keep in order, as should only need a new api/connection type added in enum hash and can then create aa new connection for it.

* Ruby version 3.1.0


