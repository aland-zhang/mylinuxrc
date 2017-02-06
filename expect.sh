#!/usr/bin/expect
set timeout 10
set username [lindex $argv 0]
set password [lindex $argv 1]

if {[llength $argv] == 0} {
  send_user "Usage: scriptname username \'password\' hostname\n"
  exit 1
}


set servers "192.168.16.170 192.168.16.186
192.168.16.171 192.168.16.187
192.168.16.172 192.168.16.188
192.168.16.173 192.168.16.189
192.168.16.190"
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