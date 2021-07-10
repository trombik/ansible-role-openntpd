# frozen_string_literal: true

require "spec_helper"
require "serverspec"

package = "openntpd"
service = "openntpd"
config  = "/etc/openntpd/ntpd.conf"
default_user = "root"
default_group = "root"
ntp_port = "123"

case os[:family]
when "freebsd"
  config = "/usr/local/etc/ntpd.conf"
  default_group = "wheel"
when "openbsd"
  service = "ntpd"
  config = "/etc/ntpd.conf"
  default_group = "wheel"
end

describe package(package) do
  it { should be_installed } if os[:family] != "openbsd"
end

describe file(config) do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by default_user }
  it { should be_grouped_into default_group }
  its(:content) { should match(/^# Managed by ansible$/) }
  its(:content) { should match(/^listen on/) }
end

case os[:family]
when "freebsd"
  describe file("/etc/rc.conf.d/openntpd") do
    it { should exist }
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by default_user }
    it { should be_grouped_into default_group }
    its(:content) { should match(/^# Managed by ansible$/) }
    its(:content) { should match(/^openntpd_flags="-s"$/) }
  end
when "ubuntu"
  describe file "/etc/default/openntpd" do
    it { should exist }
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by default_user }
    it { should be_grouped_into default_group }
    its(:content) { should match(/^# Managed by ansible$/) }
    its(:content) { should match(/^DAEMON_OPTS="-f #{config} -s"$/) }
  end
when "openbsd"
  describe file "/etc/rc.conf.local" do
    it { should exist }
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by default_user }
    it { should be_grouped_into default_group }
    its(:content) { should match(/^ntpd_flags=-s$/) }
  end
end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

describe port(ntp_port) do
  it { should be_listening.on("127.0.0.1").with("udp") }
end
