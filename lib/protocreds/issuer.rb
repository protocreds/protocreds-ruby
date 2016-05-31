module Protocreds
  # Issues new protocreds authenticated by a symmetric key
  class Issuer
    def initialize(key:, key_id:)
      @key    = key
      @key_id = key_id
    end

    def issue_credential(assertions: [])
      authenticator = Authenticator.new(@key)
      identifier    = generate_identifier

      authenticator.authenticate(identifier.to_hash)

      assertions.each do |assertion|
        authenticator.authenticate(assertion.to_hash)
      end

      Protocreds::Credential.new(
        identifier: identifier,
        assertion:  assertions,
        signature:  authenticator.signature
      )
    end

    private

    def generate_identifier(uuid: Sysrandom.uuid, key_id: @key_id, issued_at: Protocreds::DateTime.now)
      Protocreds::Identifier.new(
        uuid:      uuid,
        key_id:    key_id,
        issued_at: issued_at
      )
    end
  end
end
