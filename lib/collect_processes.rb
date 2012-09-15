require 'csv'

module GetRunningProcesses
  class CollectProcesses
    def self.read_processes
      output = `ps -ef`

      File.open('tmp/ps.csv', 'w') {|f| f.write(output) }

      file = ('tmp/ps.csv')

      list = CSV.read(file, :col_sep => ' ')

      processes = []

      list.each do |p|
        if p[0] == "UID"
        else
          result = p.slice!(7, 12).join(' ').strip
          p << result
          processes << p
        end
      end

      File.delete('tmp/ps.csv')

      return processes
    end
  end
end