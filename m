From: Pierre-Philipp Braun <pbraun@nethence.com>
Subject: failing fail-over - commit still in progress
Date: Fri, 11 Aug 2023 11:55:42 +0300
Message-ID: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nethence.com;
        s=aug2022; t=1691744141;
        bh=NRNcFo5qpSGgf+UqKjjW/WGWmvxmu40i6k9ZdrYatxw=;
        h=Date:To:From:Subject:From;
        b=Oea6STdwOad9OCWE64n0aXQZOhuUFkcypj20rT3gFTv7VPg/sW39Sp7DqErjEaJNQ
         qqx/+BtZrjOPk5CRqYwoMIM5G3GZ8TTOP/S5fHQTGCjOYa2Lf/Quq5AQI7w6PhM/X+
         3m/LQu3sI9ZxSXbZAbkm/vkVpGmpFfHzjr/muSLehk2eWThbwMx3PElPbfEuc0uczW
         dHYBW6IG6RiM1R6wBNTN6DTjLjal/Ad0yaVWvqXB7FHwpL3+Ply5wUfHnOSDZZPh0H
         JmM5bdCzCYRAN4XnZEZEla/jxU2nyLZrsi0NBDWTWzEHC1W/OLoVJJwaZMptLNRC94
         u3VJ6lqznQymw==
Content-Language: en-US, fr
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

I have a casual NAT active/passive setup with keepalived+conntrackd, on three nodes.  I am trying to validate a fail-over on inbound traffic: an open SSH connection, initiated from the outside, taking advantage of a DNAT rule that points to a system behind the NAT.

Here for example from within the ssh session:

tcp        0     52 10.1.0.50:22            178.205.50.68:27531     ESTABLISHED 288/sshd: root@pts/

I can see the state from the active node:

	# internal cache
tcp      6 ESTABLISHED src=178.205.50.68 dst=217.19.208.157 sport=27531 dport=50 src=10.1.0.50 dst=178.205.50.68 sport=22 dport=27531 [ASSURED] [active since 237s]

it's absent on node2, as we are in active/passive mode.

	# external cache
	tcp      6 ESTABLISHED src=178.205.50.68 dst=10.1.0.50 sport=27531 dport=22 [ASSURED] [active since 403s]

I can also see it on node3, although I did not disable external caches:

	# internal cache
tcp      6 ESTABLISHED src=178.205.50.68 dst=10.1.0.50 sport=27531 dport=22 src=10.1.0.50 dst=178.205.50.68 sport=22 dport=27531 [ASSURED] [active since 217s]

	# external cache
	(not there)

Why?  Because node1,2,3 are XEN virtual machine monitors that actually host guests, aside from serving NAT for them.

So here we go, this is what happens when I kill keepalived on the active node (currently node1).
node2 shows:

[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] committing all external caches
[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] Committed 71 new entries
[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] commit has taken 0.000558 seconds
[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] flushing conntrack table in 60 secs
[Fri Aug 11 11:41:59 2023] (pid=14642) [ERROR] ignoring flush command, commit still in progress
[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] resync requested
[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] resync with master conntrack table
[Fri Aug 11 11:41:59 2023] (pid=14642) [notice] sending bulk update
[Fri Aug 11 11:42:59 2023] (pid=14642) [notice] flushing kernel conntrack table (scheduled)

and node3 shows:

[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] committing all external caches
[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] Committed 3 new entries
[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] commit has taken 0.000069 seconds
[Fri Aug 11 11:41:59 2023] (pid=25228) [ERROR] ignoring flush command, commit still in progress
[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] resync with master conntrack table
[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:41:59 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:00 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:00 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:01 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:01 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:02 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:02 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:03 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:03 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:04 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:04 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:05 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:05 2023] (pid=25228) [notice] sending bulk update
[Fri Aug 11 11:42:06 2023] (pid=25228) [notice] resync requested by other node
[Fri Aug 11 11:42:06 2023] (pid=25228) [notice] sending bulk update
...

When I try to commit manually, it doesn't say another commit is in progress.
But since -c ends once it finishes, I guess that means there's either some conflicting commits going on (I don't see where, as keepalived only calls the primary script once on the new active node)
--or-- something related my network setup and eventually the discrepancy noticed above (known state on the backup) makes it so that there's a conflict.

versions:

Linux 5.16.20
nftables v1.0.1 (Fearless Fosdick #3)
Keepalived v2.2.8
Connection tracking userspace daemon v1.4.7 (GIT master branch)

nftables.conf:

define nic=xenbr0
define gst=guestbr0

table inet filter
flush table inet filter
table inet filter {
         chain input {
                 type filter hook input priority filter; policy accept;

                 ip protocol icmp accept
                 ip6 nexthdr ipv6-icmp accept
                 #ip protocol vrrp ip daddr 224.0.0.0/8 accept
                 ip protocol vrrp accept

                 #iif $nic tcp dport 1-3000 accept
                 #iif $nic tcp dport 64999 accept

                 # conntrackd wants drop
                 #iif $nic ct state established,related accept
                 #iif $nic drop

                 #iif $gst ct state established,related accept
                 #iif $gst drop
         }

         # NAT --> accept
         chain forward {
                 type filter hook forward priority filter; policy accept;
         }

         chain output {
                 type filter hook output priority filter; policy accept;

                 ip protocol icmp accept
                 ip6 nexthdr ipv6-icmp accept
                 #ip protocol vrrp ip saddr 224.0.0.0/8 accept
                 ip protocol vrrp accept

                 # conntrack wants drop
                 #oif $gst ct state established,related accept
                 #oif $gst drop
         }
}

table ip nat
flush table ip nat
table ip nat {
         chain postrouting {
                 type nat hook postrouting priority srcnat;
                 ip saddr 10.1.0.0/16 oif $nic snat 217.19.208.154;
                 #ip saddr 10.1.0.0/16 oif $nic snat 217.19.208.157;
         }

         chain prerouting {
                 type nat hook prerouting priority dstnat;

		...
                 iif $nic tcp dport 50 dnat 10.1.0.50:22;
		...
         }
}

keepalived.conf:

         max_auto_priority -1

         notification_email {
                 support@angrycow.ru
         }

         notification_email_from support@angrycow.ru
         checker_log_all_failures
         default_interface xenbr0

         # need root for conntrackd
         #enable_script_security
         #script_user keepalive keepalive
}

vrrp_sync_group nat {
         group {
                 front-vip
                 guest-vip
         }

         # active/passive
         notify_master   "/etc/conntrackd/primary-backup.bash primary"
         notify_backup   "/etc/conntrackd/primary-backup.bash backup"
         notify_fault    "/etc/conntrackd/primary-backup.bash fault"

         # active/active
         #notify "/var/tmp/notify.bash"
}

vrrp_instance front-vip {
         state BACKUP
         interface xenbr0
         virtual_router_id 1
         priority 1
         advert_int 1

         virtual_ipaddress {
                 217.19.208.157/29
         }
         # default route remains anyhow

         notify "/var/tmp/notify.bash"
}

vrrp_instance guest-vip {
         state BACKUP
         interface guestbr0
         virtual_router_id 2
         priority 1
         advert_int 1

         virtual_ipaddress {
                 10.1.255.254/16
         }

         notify "/var/tmp/notify.bash"
}

==> same on all nodes, letting vrrp do its own election...

conntrackd.conf:

Sync {
         Mode FTFW {
                 # casual fail-over - active/passive
                 DisableExternalCache off

                 # active/active
                 #DisableExternalCache on

                 # grab states from the past
                 StartupResync on
         }

         UDP {
IPv4_address 10.3.3.1
                 IPv4_Destination_Address 10.3.3.2
                 IPv4_Destination_Address 10.3.3.3
                 Port 3780
                 Interface br0
                 SndSocketBuffer 1249280
                 RcvSocketBuffer 1249280
                 Checksum on
         }
}

General {
         Systemd off
         HashSize 8192
         # 2 x /proc/sys/net/netfilter/nf_conntrack_max
         HashLimit 131072
         LogFile on
         Syslog off
         LockFile /var/lock/conntrack.lock

         NetlinkBufferSize 2097152
         NetlinkBufferSizeMaxGrowth 8388608


         UNIX {
                 Path /var/run/conntrackd.ctl
         }

         Filter {
                 Protocol Accept {
                         TCP
                         #SCTP
                         #UDP
                         #ICMP
                 }

                 Address Ignore {
                         IPv4_address 127.0.0.1
                         IPv6_address ::1

                         # don't track cluster/storage network
                         IPv4_address 10.3.3.0/24
                      }

                 State Accept {
                         ESTABLISHED CLOSED TIME_WAIT CLOSE_WAIT for TCP
                 }
         }
}

It's been hard to troubleshoot, I don't see what's wrong in my setup, please advise.

BR
-elge
