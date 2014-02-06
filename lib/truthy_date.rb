module TruthyDate
  def truthy_date(attribute, options)
    raise ArgumentError, "missing :as for datetime_booleanify" unless options[:as]

    define_method("#{options[:as]}=") do |value|
      self.send("#{attribute}=", ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value) ? Time.now : nil)
    end

    define_method("#{options[:as]}?") do
      self.send(attribute).present?
    end

    define_method("#{options[:as]}") do
      self.send("#{options[:as]}?")
    end
  end
end
