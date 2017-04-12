#!/usr/bin/expect
set timeout 10
set username [lindex $argv 0]
set password [lindex $argv 1]

if {[llength $argv] == 0} {
  send_user "Usage: scriptname username \'password\' hostname\n"
  exit 1
}
set servers "192.168.16.158 192.168.16.60 192.168.16.93 192.168.16.116	
192.168.16.61 192.168.16.94 192.168.16.117 192.168.16.159
192.168.16.62 192.168.16.95 192.168.16.118 192.168.16.160
192.168.16.63 192.168.16.96 192.168.16.119 192.168.16.161
192.168.16.64 192.168.16.97 192.168.16.120 192.168.16.162"
foreach server $servers {
	send_user "\n#####\n# $username@$server\n#####\n"
	spawn ssh -o StrictHostKeyChecking=no "$username@$server" "yum -y install centos-release-gluster38 &&
	yum -y install glusterfs gluster-cli glusterfs-libs glusterfs-server"

	expect {
	  timeout { send_user "\nFailed to get password prompt\n"}
	  eof { send_user "\nSSH failure for $hostname\n"}
	  "*assword"
	}

	send "$password\r"

	expect {
	  timeout {send_user "\nLogin failed. Password incorrect.\n"}
	  "*\$ "
	}

	send_user "\nPassword is correct\n"
}