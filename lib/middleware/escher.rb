require 'escher/rack_middleware'
# require 'logger'
Escher::RackMiddleware.config do |c|

  # logger specific file
  c.logger = Logger.new('log/escher.log')

  # for read more about escher auth object initialization please visit escherauth.io
  c.add_escher_authenticator{ Escher::Auth.new( CredentialScope, AuthOptions ) }

  # this will be triggered every time a request hit your appication
  c.add_credential_updater{ Escher::Keypool.new.get_key_db }
  # c.add_include_path(/^\/*integrations\//) or exclude /integrations/
end

use Escher::RackMiddleware
run Signature::App