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
  end
end
