require_relative 'db_connection'
require 'active_support/inflector'
#NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
#    of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    columns = DBConnection.execute2(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    SQL
    symbols = columns.first.map &:to_sym
  end

  def self.finalize!
    columns.each do |column|
      define_method("#{column}=") do |value|
        self.instance_variable_set("@#{column}",value)
      end
      define_method(column) {self.instance_variable_get("@#{column}")}
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name.tableize
  end

  def self.table_name
    # ...
    if @table_name == nil
      self.to_s.tableize
    else
      @table_name
    end
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def attributes
    # ...
    @attributes = {} if @attributes == nil
  end

  def insert
    # ...
  end

  def initialize
    # ...
  end

  def save
    # ...
  end

  def update
    # ...
  end

  def attribute_values
    # ...
  end
end