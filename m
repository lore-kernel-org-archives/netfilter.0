From: Thierry ITTY <thierry.itty@besancon.org>
Subject: Re: voice IP
Date: Tue, 04 Nov 2003 08:33:41
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.1.16.20031104083341.251f9fb4@s-net-04.besancon.org>
References: <3FA6B9B8.2040703@adinet.com.uy>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA6B9B8.2040703@adinet.com.uy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Manuel Tato <madness@adinet.com.uy>
Cc: netfilter@lists.netfilter.org

it looks to me that, for getting incoming calls, you try to reach your voip
gateway from "outside" with a private address (192.168.1.40) which your
firewall is aware of, but as private addresses are not routed on the
internet, you'll never get any incoming packets.=20
outgoing calls work fine because of the masquerade rule and the h323=
 helpers.
this is actually not an iptables problem.
due to h323 protocol you can't just do a static port forwarding to handle
incoming calls=20
maybe you could try to redirect a broad range of ports and configuring your
gateway to negociate only ports within this range, if possible
maybe also you could try to redirect the known h323 ports, and all
unrelated/unestablished incoming udp packets, considering such packets to
be voip traffic, or do a redirection based on some diffserv value, doing
the same assumption...
of course such port redirections need that the incoming packets are sent to
the public address of your firewall (which is the only one reachable from
outside) thus need an additional DNAT rule with redirection, and of course
an SNAT rule for outgoing packets (and NO masquerading)

hth

please let me know




A 17:25 03/11/2003 -0300, vous avez =E9crit :
>i have this firewall, i have at 192.168.1.40 a voice ip gateway, i'm=20
>doing portforward to this ip.
>i make phone calls with out major problems, but i can=B4t recive any...
>someone have voip experience trough linux fw/routers?
>thanks in advance
>manuel
>
>
>#!/bin/bash
># eth1--> Modem/ADSL
># eth0--> LAN
>#
>echo 1 > /proc/sys/net/ipv4/ip_forward
>modprobe ipt_MASQUERADE
>modprobe ip_conntrack
>modprobe ip_conntrack_ftp
>modprobe iptable_nat
>modprobe ip_conntrack_h323
>modprobe ip_nat_h323
>#
>iptables -F
>iptables -t nat -F
>iptables -t mangle -F
>iptables -A INPUT -j ACCEPT
>iptables -A FORWARD -j ACCEPT
>iptables -A OUTPUT -j ACCEPT
>
>iptables -A FORWARD -p tcp --sport 137:139 -j DROP
>iptables -A FORWARD -p udp --sport 137:139 -j DROP
>#    NFS Mount Service (TCP/UDP 635)
>iptables -A FORWARD -p tcp --sport 635 -j DROP
>iptables -A FORWARD -p udp --sport 635 -j DROP
>#    NFS (TCP/UDP 2049)
>iptables -A FORWARD -p tcp --sport 2049 -j DROP
>iptables -A FORWARD -p udp --sport 2049 -j DROP
>#    Portmapper (TCP/UDP 111)
>iptables -A FORWARD -p tcp --sport 111 -j DROP
>iptables -A FORWARD -p udp --sport 111 -j DROP
># Block incoming syslog, lpr, rsh, rexec...
>iptables -A FORWARD -i eth1 -p udp --dport syslog -j DROP
>iptables -A FORWARD -i eth1 -p tcp --dport 515 -j DROP
>iptables -A FORWARD -i eth1 -p tcp --dport 514 -j DROP
>iptables -A FORWARD -i eth1 -p tcp --dport 512 -j DROP
>###
>#
># NAT
>iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>######
>#####
>#######
>iptables -A FORWARD -p tcp --sport 1719:1789 -j ACCEPT
>iptables -A FORWARD -p udp --sport 1719:1789 -j ACCEPT
>
>iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 -j DNAT --to=20
>192.168.1.40:80
>iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 80 -j ACCEPT
>iptables -t nat -A PREROUTING -p tcp --dport 23 -i eth1 -j DNAT --to=20
>192.168.1.40:23
>iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 23 -j ACCEPT
>iptables -t nat -A PREROUTING -p tcp --dport 161 -i eth1 -j DNAT --to=20
>192.168.1.40:161
>iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 161 -j ACCEPT
>iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT=20
>--to 192.168.1.40:1726:1789
>iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 1726:1789 -j=20
>ACCEPT
>iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT=20
>--to 192.168.1.40:1726:1789
>iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport  1726:1789 -j=20
>ACCEPT
>
>
>
>
>
>
>

