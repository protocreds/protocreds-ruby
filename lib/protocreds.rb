require "protocreds/version"

require "openssl"
require "objecthash"
require "sysrandom"
require "protobuf"

require "protocreds/credential.pb"

require "protocreds/authenticator"
require "protocreds/keyring"
require "protocreds/helpers"
require "protocreds/issuer"
require "protocreds/verifier"

# Protobuf-based credential format, inspired by ideas from Macaroons and SPKI/SDSI
module Protocreds
end
