# frozen_string_literal: true

module JSONLT
  # Represents a JSONLT table stored in an append-only file.
  #
  # A Table provides key-value storage backed by a JSON Lines file,
  # optimized for version control diffs and human readability.
  class Table
    # Creates a new Table instance.
    #
    # @param path [String, Pathname] the path to the JSONLT file
    # @raise [NotImplementedError] this method is not yet implemented
    def initialize(path)
      @path = path
      raise NotImplementedError, "JSONLT::Table is not yet implemented"
    end

    # Returns the record for the given key.
    #
    # @param key [String] the key to look up
    # @return [Hash, nil] the record value, or nil if not found
    # @raise [NotImplementedError] this method is not yet implemented
    def get(key)
      raise NotImplementedError, "JSONLT::Table#get is not yet implemented"
    end

    # Sets a record for the given key.
    #
    # @param key [String] the key to set
    # @param value [Hash] the record value
    # @return [void]
    # @raise [NotImplementedError] this method is not yet implemented
    def set(key, value)
      raise NotImplementedError, "JSONLT::Table#set is not yet implemented"
    end

    # Deletes the record for the given key.
    #
    # @param key [String] the key to delete
    # @return [Boolean] true if a record was deleted, false otherwise
    # @raise [NotImplementedError] this method is not yet implemented
    def delete(key)
      raise NotImplementedError, "JSONLT::Table#delete is not yet implemented"
    end

    # Checks if a record exists for the given key.
    #
    # @param key [String] the key to check
    # @return [Boolean] true if the key exists, false otherwise
    # @raise [NotImplementedError] this method is not yet implemented
    def key?(key)
      raise NotImplementedError, "JSONLT::Table#key? is not yet implemented"
    end

    # Returns all keys in the table.
    #
    # @return [Array<String>] the list of keys
    # @raise [NotImplementedError] this method is not yet implemented
    def keys
      raise NotImplementedError, "JSONLT::Table#keys is not yet implemented"
    end

    # Returns all records in the table as a hash.
    #
    # @return [Hash] mapping of keys to record values
    # @raise [NotImplementedError] this method is not yet implemented
    def to_h
      raise NotImplementedError, "JSONLT::Table#to_h is not yet implemented"
    end

    # Iterates over each key-value pair in the table.
    #
    # @yield [key, value] the key-value pair
    # @yieldparam key [String] the record key
    # @yieldparam value [Hash] the record value
    # @return [Enumerator] if no block given
    # @raise [NotImplementedError] this method is not yet implemented
    def each(&)
      raise NotImplementedError, "JSONLT::Table#each is not yet implemented"
    end

    # Returns the number of records in the table.
    #
    # @return [Integer] the record count
    # @raise [NotImplementedError] this method is not yet implemented
    def size
      raise NotImplementedError, "JSONLT::Table#size is not yet implemented"
    end

    alias length size

    # Compacts the table, removing obsolete entries.
    #
    # @return [void]
    # @raise [NotImplementedError] this method is not yet implemented
    def compact!
      raise NotImplementedError, "JSONLT::Table#compact! is not yet implemented"
    end
  end
end
