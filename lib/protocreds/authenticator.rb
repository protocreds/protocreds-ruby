module Protocreds
  # Authenticate Protocreds using a chained HMAC construction
  # Allows for extensibility/delegation (a length extension attack on a cookie!)
  class Authenticator
    DIGEST_TYPE = "SHA256".freeze

    def initialize(key)
      @key = key
    end

    def authenticate(value)
      @key = OpenSSL::HMAC.digest(
        OpenSSL::Digest.new(DIGEST_TYPE),
        @key,
        ObjectHash.digest(value)
      )
    end

    def signature
      @key
    end
  end
end
