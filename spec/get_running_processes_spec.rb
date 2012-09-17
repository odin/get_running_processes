require 'spec_helper'

describe GetRunningProcesses do
  describe "Methods" do
    describe ".collect_processes" do
      it "returns an array of processes and their PIDs" do
        processes = GetRunningProcesses.collect_processes
        expect(processes[0][1]).to eq('1')
        expect(processes[0][7]).to eq('/sbin/init')
      end
    end
    
    describe "#commands" do
      it "returns an array of the running commands" do
        processes = GetRunningProcesses.processes
        expect(processes.commands).to include("ps -ef")
      end
    end
    
    describe "#commands_with_pids" do
      it "returns an array of hashes with the pid as the key and the command as a value" do
        processes = GetRunningProcesses.processes
        expect(processes.commands_with_pids).to include({1 => "/sbin/init"})
      end
    end
    
    describe "#all" do
      it "returns an array of hashes with all information from the ps output" do
        processes = GetRunningProcesses.processes
        expect(processes.all).to include({"UID"=>"root", "PID"=>"1", "PPID"=>"0", "C"=>"0", "STIME"=>"09:01", "TTY"=>"?", "TIME"=>"00:00:03", "CMD"=>"/sbin/init"})
      end
    end
  end
end
