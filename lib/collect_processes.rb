module GetRunningProcesses
  class CollectProcesses
    def self.read_processes
      output = `ps -ef`

      processes = []

      lines = []

      output.lines.each do |line|
        process = line.split(' ')
        lines << process
      end

      lines.each do |line|
        if line[0] == "UID"
        else
          result = line.slice!(7, 30).join(' ').strip
          line << result
          processes << line
        end
      end

      return processes
    end
  end
end
