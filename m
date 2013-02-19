From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd questions
Date: Tue, 19 Feb 2013 20:52:37 +0100
Message-ID: <20130219195237.GA3208@localhost>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <listaddr@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Marco,

On Tue, Feb 19, 2013 at 03:18:09PM +0100, Marco wrote:
> I'm setting up a virtual environment to test conntrackd in an
> active/backup configuration using FTFW. While it mostly works fine,
> I'm seeing some issues and I don't know whether they are expected or
> not.
> I'm using keepalived to handle the VIPs, and the provided
> primary-backup.sh script to manage conntrackd cache synchronization.
> 
> This is my setup:
> 
> 
>   external VIP: 10.0.0.200
>  eth0 (.201)      eth0 (.202)
> +-----+          +-----+
> | FW1 |          | FW2 |
> +-----+          +-----+
>  eth1 (.2)        eth1 (.3)
>   internal VIP: 192.168.1.1
> 
> 
>       +--------+
>       | client |
>       +--------+
> 
> 
> Both firewalls are configured to perform SNAT --to-source 10.0.0.200
> for the traffic coming from the client.
> 
> The client generates traffic continuously with this simple script:
> 
> while true; do
>   for i in www.site1.com www.site2.com www.site3.com www.site4.com
> www.site5.com www.site6.com; do
>     wget -O/dev/null http://$i
>   done
> done
> 
> To do failover, I stop keepalived on FW1 so FW2 becomes active. To do
> failback, I restart it so FW1 is again the active.
> 
> What happens is that sometimes (apparently randomly) the client's wget
> gets stuck after a failover or a failback, and does not even time out;
> I have to stop it with ctrl-c.
> 
> Here are my configuration files:
> 
> keepalived.conf on FW1:
> 
> vrrp_sync_group G1 {   # must be before vrrp_instance declaration
>   group {
>     E1
>     I1
>   }
>   notify_master "/etc/conntrackd/primary-backup.sh primary"
>   notify_backup "/etc/conntrackd/primary-backup.sh backup"
>   notify_fault "/etc/conntrackd/primary-backup.sh fault"
> }
> 
> vrrp_instance E1 {
>     interface eth0
>     state MASTER
>     virtual_router_id 61
>     priority 100
>     advert_int 1
>     authentication {
>       auth_type PASS
>       auth_pass papas_con_tomate
>     }
>     virtual_ipaddress {
>         10.0.0.200/24 dev eth0
>     }
> }
> 
> vrrp_instance I1 {
>     interface eth1
>     state MASTER
>     virtual_router_id 62
>     priority 100
>     advert_int 1
>     authentication {
>       auth_type PASS
>       auth_pass papas_con_tomate
>     }
>     virtual_ipaddress {
>         192.168.1.1/24 dev eth1
>     }
> }
> 
> On fw2, it's the same but with state BACKUP and priority 50.
> 
> conntrackd.conf on FW1  (for simplicity, I'm not using a dedicated
> link for now):
> 
> Sync {
> 	Mode FTFW {
> 		DisableExternalCache Off
> 	}
> 	Multicast {
> 		IPv4_address 225.0.0.50
> 		Group 3780
> 		IPv4_interface 192.168.1.2
> 		Interface eth1
> 		SndSocketBuffer 1249280
> 		RcvSocketBuffer 1249280
> 		Checksum on
> 	}
> }
> General {
> 	Nice -20
> 	HashSize 32768
> 	HashLimit 131072
> 	LogFile on
> 	Syslog on
> 	LockFile /var/lock/conntrack.lock
> 	UNIX {
> 		Path /var/run/conntrackd.ctl
> 		Backlog 20
> 	}
> 	NetlinkBufferSize 2097152
> 	NetlinkBufferSizeMaxGrowth 8388608
> 	Filter From Userspace {
> 		Protocol Accept {
> 			TCP
> 			UDP
> 			ICMP # This requires a Linux kernel >= 2.6.31
> 		}
> 		Address Ignore {
>         IPv4_address 127.0.0.1 # loopback
>         IPv4_address 10.0.0.202
>         IPv4_address 10.0.0.200
>         IPv4_address 192.168.1.2
>         IPv4_address 192.168.1.1
> 		}
> 	}
> }
> on FW2:
> 
> Sync {
> 	Mode FTFW {
> 		DisableExternalCache Off
> 	}
> 	Multicast {
> 		IPv4_address 225.0.0.50
> 		Group 3780
> 		IPv4_interface 192.168.1.3
> 		Interface eth1
> 		SndSocketBuffer 1249280
> 		RcvSocketBuffer 1249280
> 		Checksum on
> 	}
> }
> General {
> 	Nice -20
> 	HashSize 32768
> 	HashLimit 131072
> 	LogFile on
> 	Syslog on
> 	LockFile /var/lock/conntrack.lock
> 	UNIX {
> 		Path /var/run/conntrackd.ctl
> 		Backlog 20
> 	}
> 	NetlinkBufferSize 2097152
> 	NetlinkBufferSizeMaxGrowth 8388608
> 	Filter From Userspace {
> 		Protocol Accept {
> 			TCP
> 			UDP
> 			ICMP # This requires a Linux kernel >= 2.6.31
> 		}
> 		Address Ignore {
>         IPv4_address 127.0.0.1 # loopback
>         IPv4_address 10.0.0.203
>         IPv4_address 10.0.0.200
>         IPv4_address 192.168.1.3
>         IPv4_address 192.168.1.1
> 		}
> 	}
> }
> 
> 
> Thanks in advance for any help.

There are several things that you can check to troubleshoot
conntrackd:

1) Log files: /var/log/conntrackd.log and /var/log/keepalived.log
2) See if entries are actually synchronized via `conntrackd -i' and
`conntrackd -e' and other statistics.
3) echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_invalid, to
see if the connection tracking system is marking packets as invalid.

I also suggest you to read the official documentation:

http://conntrack-tools.netfilter.org/manual.html

Regards.
