# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'

module Protocreds

  ##
  # Message Classes
  #
  class DateTime < ::Protobuf::Message; end
  class Identifier < ::Protobuf::Message; end
  class Assertion < ::Protobuf::Message
    class Type < ::Protobuf::Enum
      define :CLAIM, 1
      define :CAVEAT, 2
    end

  end

  class Credential < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class DateTime
    required :uint32, :value, 1
  end

  class Identifier
    required :bytes, :uuid, 1
    required :bytes, :key_id, 2
    required ::Protocreds::DateTime, :issued_at, 3
  end

  class Assertion
    required :bytes, :name, 1
    required :bytes, :value, 2
  end

  class Credential
    required ::Protocreds::Identifier, :identifier, 1
    repeated ::Protocreds::Assertion, :assertion, 2
    required :bytes, :signature, 3
  end

end

