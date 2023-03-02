module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    def each
      @csv_contents.each{ |row| yield row }
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
    class CsvRow

      attr_accessor :row, :header
      def initialize(header, row)
        @row = row
        @header = header
      end

      def method_missing name, *args, &block
        index = @header.index(name.to_s)
        if index
          @row[index]
        else
          "not found"
        end
      end

    end
  end
end



class RubyCsv #no inheritance, we can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
m.each {|row| puts "#{row.one} #{row.three}"}
puts m.headers.inspect
puts m.csv_contents.inspect




