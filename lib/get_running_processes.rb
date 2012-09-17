require 'get_running_processes/version'
require 'processes'

module GetRunningProcesses
  def self.collect_processes
    Processes.get_process_array
  end
  
  def self.processes
    Processes.new
  end
end
