require 'get_running_processes/version'
require 'collect_processes'

module GetRunningProcesses
  def self.collect_processes
    CollectProcesses.read_processes
  end
end
