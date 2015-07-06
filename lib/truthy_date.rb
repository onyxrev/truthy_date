module TruthyDate
  def truthy_date(attribute, options)
    raise ArgumentError, "missing :as for truthy_date" unless options[:as]

    define_method("#{options[:as]}=") do |value|
      self.send("#{attribute}=",  ActiveRecord::Type::Boolean.new.type_cast_from_database(value) ? Time.now : nil)
    end

    define_method("#{options[:as]}?") do
      !!self.send(attribute)
    end

    define_method("#{options[:as]}") do
      self.send("#{options[:as]}?")
    end
  end
end
