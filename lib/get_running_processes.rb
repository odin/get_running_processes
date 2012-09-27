require 'get_running_processes/version'
require 'get_running_processes/processes'

module GetRunningProcesses
  def self.collect_processes
    Processes.new.get_process_array
  end

  def self.processes
    Processes.new
  end
end
