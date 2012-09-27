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

    describe "#all" do
      it "returns an array of hashes with all information from the ps output" do
        processes = GetRunningProcesses.processes
        expect(processes.all[0].keys).to eq(["UID", "PID", "PPID", "C", "STIME", "TTY", "TIME", "CMD"])
        expect(processes.all[0]["UID"]).to eq("root")
        expect(processes.all[0]["PID"]).to eq(1)
      end
    end

    describe "#commands" do
      it "returns an array of the running commands" do
        processes = GetRunningProcesses.processes
        expect(processes.commands).to include("ps -ef")
      end
    end

    describe "#commands_with_pids" do
      it "returns an array of hashes with the command as the key and the pid as a value" do
        processes = GetRunningProcesses.processes
        expect(processes.commands_with_pids).to include({ "/sbin/init" => 1 })
      end
    end

    describe "#pids_with_commands" do
      it "returns an array of hashes with the pid as the key and the command as a value" do
        processes = GetRunningProcesses.processes
        expect(processes.pids_with_commands).to include({ 1 => "/sbin/init" })
      end
    end
  end
end
