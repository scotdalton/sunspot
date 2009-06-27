module Sunspot
  # This class encapsulates a facet row (value) for a facet.
  class FacetRow
    def initialize(pair, field) #:nodoc:
      @pair, @field = pair, field
    end

    # The value associated with the facet. This will be cast according to the
    # field's type; so, for an integer field, this method will return an
    # integer, etc.
    #
    # Note that <strong>+Time+ fields will always return facet values in
    # UTC</strong>.
    #
    # ==== Returns
    #
    # Object:: The value associated with the row, cast to the appropriate type
    #
    def value
      @value ||= @field.cast(@pair[0])
    end

    # The number of documents matching the search parameters that have this
    # value in the facet's field.
    #
    # ==== Returns
    #
    # Integer:: Document count for this value
    #
    def count
      @count ||= @pair[1]
    end
  end
end
