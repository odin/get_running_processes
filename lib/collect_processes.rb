module GetRunningProcesses
  class CollectProcesses
    def self.read_processes
      output = `ps -ef`

      # Container for returned processes
      processes = []

      # Container for processing the lines
      lines = []

      # Grab the lines from ps and collect into Arrays
      output.lines.each do |line|
        process = line.split(' ')
        lines << process
      end

      # Process the lines from ps and concat the command names
      lines.each do |line|
        # Skip the header row
        # TODO: Use this header row to extract PID, CMD, etc.
        if line[0] == "UID"
        else
          # Concatenate the command after splitting on spaces
          result = line.slice!(7, 30).join(' ').strip
          line << result
          processes << line
        end
      end

      # Returns the Array
      return processes
    end
  end
end
