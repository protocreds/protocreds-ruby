module Protocreds
  # Verifies authenticity and caveats of Protocreds against a given set of matchers
  class Verifier
    def initialize(keyring:, matchers: {})
      @keyring  = keyring
      @matchers = matchers
    end
  end
end
