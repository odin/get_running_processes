module GetRunningProcesses
  class Processes
    attr_reader :commands,
                :commands_with_pids,
                :all
              
    def initialize
      @all                = Processes.get_all
      @commands           = Processes.get_commands
      @commands_with_pids = Processes.get_commands_with_pids
    end
    
    def self.get_commands
      processes = Processes.get_process_array
      
      commands = []
      
      processes.each do |process|
        commands << process[7]
      end
      
      return commands
    end
    
    def self.get_commands_with_pids
      processes = Processes.get_process_array
      
      commands_with_pids = []
      
      processes.each do |process|
        command = Hash.new
        
        command[process[1].to_i] = process[7]
        
        commands_with_pids << command
      end
      
      return commands_with_pids
    end
    
    def self.get_all
      processes = Processes.get_process_array
      
      all = []
      
      processes.each do |process|
        command = Hash.new
        
        command["UID"]   = process[0]
        command["PID"]   = process[1]
        command["PPID"]  = process[2]
        command["C"]     = process[3]
        command["STIME"] = process[4]
        command["TTY"]   = process[5]
        command["TIME"]  = process[6]
        command["CMD"]   = process[7]
        
        all << command
      end
      
      return all
    end
  
    def self.get_process_array
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
