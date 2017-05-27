module Makeitreal
  module Models
    class User < Person
      attr_accessor :role
      def initialize(email, full_name, role)
        @role = role
        super email, full_name
      end
    end
  end
end
