From: elko <elko@clevertrace.com>
Subject: Re: VLAN et iptables
Date: Sat, 03 Apr 2010 07:46:55 +0200
Message-ID: <1270273615.4034.1.camel@makina.clevertrace.com>
References: <201004030927.53528.jeetu.golani@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201004030927.53528.jeetu.golani@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeetu Golani <jeetu.golani@gmail.com>
Cc: netfilter@vger.kernel.org, Arun Khan <arun.khan@silverarc.biz>, Erle Pereira <biz@erlepereira.com>

What you have as output of 

ifconfig 

I cannot see your vlan interfaces in iptabels ? 

Best regards, 
Elko

On Sat, 2010-04-03 at 09:27 +0530, Jeetu Golani wrote:
> Hi,
> 
> I have a Debian system that I am trying to configure as a router for a MPLS 
> VPN setup. I'm having trouble setting up the iptables rules to forward 
> internet traffic from remote locations. Admittedly this isn't my forte 
> therefore I would sincerely appreciate any help :)
> 
> Network Description:
> At the head office, the ISP facing router has two physical NICs (eth0 and 
> eth1).
> 
> eth0 is connected to the head office  "local"  LAN  192.168.0.0/24.
> 
> eth1 has two VLAN interfaces 105 and 689 (vlan105 and vlan689) 
> connecting to the Service Provider's (SP)  Network
> Termination Unit (NTU)
> 
> vlan105 carries VPN traffic coming in from remote locations e.g two
> LANs subnets over MPLS VPN (a) 192.168.1.0/24 and (b) 172.16.0.0/16
> 
> vlan689 carries company <> INTERNET traffic
> 
> Internet access for "remote" locations, all Internet traffic comes to
> above router over vlan105 sub interface and have it SNAT'd/Masquerade
> to the Internet over vlan689 interface.
> ---------------------
> 
> The following is the iptables script I have tried however it doesn't work:
> 
> INTIF1="eth0"     # physical interface for local LAN
> INTIF2="vlan105"  # VLAN iface for VPN traffic to remote location
> EXTIF="vlan689"   # VLAN iface for INTERNET traffic
> EXTIP="x.x.x.x" #public IP for our CE router
> 
> /sbin/depmod -a
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_conntrack_irc
> /sbin/modprobe iptable_nat
> /sbin/modprobe ip_nat_ftp
>  echo "1" > /proc/sys/net/ipv4/ip_forward
> #echo "1" > /proc/sys/net/ipv4/ip_dynaddr
> 
> iptables -P INPUT ACCEPT
> iptables -F INPUT 
> iptables -P OUTPUT ACCEPT
> iptables -F OUTPUT 
>  iptables -P FORWARD DROP
> iptables -F FORWARD
> 
> iptables -t nat -F
> 
> # for Matunga subnet 192.168.0.0/24
>  iptables -A FORWARD -i $EXTIF -o $INTIF1 -d 192.168.0.0/24 -m state --
> state ESTABLISHED,RELATED -j ACCEPT
>  iptables -A FORWARD -i $INTIF1 -o $EXTIF -s 192.168.0.0/24 -m -j 
> ACCEPT
> 
>  # for Silvassa subnet 172.16.0.0/16
> iptables -A FORWARD -i $EXTIF -o $INTIF2 -d 172.16.0.0/16 -m state --state 
> ESTABLISHED,RELATED -j ACCEPT
>  iptables -A FORWARD -i $INTIF2 -o $EXTIF -s 172.16.0.0/16 -m -j ACCEPT
> 
>  # for Colaba subnet 192.168.1.0/24
> iptables -A FORWARD -i $EXTIF -o $INTIF2 -d 192.168.1.0/24 -m state --
> state ESTABLISHED,RELATED -j ACCEPT
>  iptables -A FORWARD -i $INTIF2 -o $EXTIF -s 192.168.1.0/24 -m -j 
> ACCEPT
> 
> iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> 
> --------------------------------------------
> 
> Would sincerely appreciate any help. Thanks
> 
> Bye for now
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


