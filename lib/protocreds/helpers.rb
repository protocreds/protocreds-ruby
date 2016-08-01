require "protocreds/credential.pb"

module Protocreds
  # DateTime type for use with Protocreds
  class DateTime < ::Protobuf::Message
    def self.from_time(time)
      new(value: time.to_i)
    end

    def self.now
      from_time(Time.now)
    end

    def to_time
      Time.at(value).utc
    end
  end

  # A symmetric Protocreds bearer credential
  class Credential < ::Protobuf::Message
    def add_caveat(caveat)
      authenticator = Authenticator.new(signature)
      authenticator.authenticate(caveat.to_hash)

      self.caveat   += caveat
      self.signature = authenticator.signature
    end
  end
end
