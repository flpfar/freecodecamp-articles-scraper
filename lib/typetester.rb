class TypeTester
  def self.get_type(results)
    type = :invalid
    type = :article if results.is_a?(Array) && results.all?(String)
    type = check_hash(results) if results.is_a?(Hash)
    type
  end

  private_class_method def self.check_hash(results)
    values = results.values
    type = if values.all? { |value| value.is_a?(Hash) && value.key?(:profile) }
             :author
           elsif values.all?(Integer)
             :tag
           else
             :invalid
           end
    type
  end
end
