module Protocreds
  # Stores keys to be used for minting and verifying Protocreds
  class Keyring
    # Size of a key in bytes (256-bits, after parsing from hex)
    KEY_LENGTH = 32

    attr_reader :default_key_id

    def self.generate_key
      Sysrandom.hex(KEY_LENGTH)
    end

    def initialize(keys: nil, key_id: nil)
      raise TypeError, "expected Hash, got #{keys.class}" unless keys.is_a? Hash
      raise ArgumentError, "key_id not in keyring: #{key_id.inspect}" unless keys.key?(key_id)

      keys.each do |id, key|
        id.freeze
        raise ArgumentError, "malformatted key: #{id}" unless key.length == KEY_LENGTH * 2 # hex
      end

      @keys = keys.freeze
      @default_key_id = key_id.freeze
    end

    # Primary key on the keyring we should use for generating new Protocreds
    def default_key
      @keys[@default_key_id]
    end

    # Read a key from the keyring
    def fetch(key_id)
      @keys.fetch(key_id)
    end

    def inspect
      format "<%s:0x%014x (key IDs: %s) [default: %s]>",
             self.class.name,
             (object_id << 1),
             @keys.keys.join(", "),
             @default_key_id
    end
  end
end
