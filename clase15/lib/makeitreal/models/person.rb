module Makeitreal
  module Models
    class Person
      attr_accessor :email, :full_name
      def initialize(email, full_name)
        @email, @full_name = email, full_name
      end
    end
  end
end
