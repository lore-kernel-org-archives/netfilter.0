From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: voice IP
Date: Mon, 3 Nov 2003 15:01:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311031501.18612.Herman@AerospaceSoftware.com>
References: <3FA6B9B8.2040703@adinet.com.uy>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA6B9B8.2040703@adinet.com.uy>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Manuel Tato <madness@adinet.com.uy>, netfilter@lists.netfilter.org

Hmm, it looks to me as if the very first rules in your INPUT, OUTPUT and =

FORWARD chains are all ACCEPT, so this is pretty much a do-nothing firewa=
ll.  =

It will let everything through unchanged in both directions.  So if you c=
an =

only initiate things in one direction, it is not the fault of this partic=
ular =

setup...

So, why do you have all those prerouting and postrouting rules? Do you ha=
ve =

any idea what they are supposed to do?

Normally, the first thing to do is to flush the existing rules, then set =
the =

default policies to DROP and finally start to build a rule set.  You can =
do =

this manually from the command line:

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

Now start to add rules to do something useful.
List the rules with iptables -L to see wat you got.

Monitor your progress with tcpdump:
tcpdump -i eth1
tcpdump -i eth0

Open a gazillion console windows for each tcpdump and iptables experiment=
ation =

area and start playing.

Cheers,

H.

On Monday 03 November 2003 8:25 pm, Manuel Tato wrote:
> i have this firewall, i have at 192.168.1.40 a voice ip gateway, i'm
> doing portforward to this ip.
> i make phone calls with out major problems, but i can=B4t recive any...=

> someone have voip experience trough linux fw/routers?
> thanks in advance
> manuel
>
>
> #!/bin/bash
> # eth1--> Modem/ADSL
> # eth0--> LAN
> #
> echo 1 > /proc/sys/net/ipv4/ip_forward
> modprobe ipt_MASQUERADE
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
> modprobe iptable_nat
> modprobe ip_conntrack_h323
> modprobe ip_nat_h323
> #
> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -A OUTPUT -j ACCEPT
>
> iptables -A FORWARD -p tcp --sport 137:139 -j DROP
> iptables -A FORWARD -p udp --sport 137:139 -j DROP
> #    NFS Mount Service (TCP/UDP 635)
> iptables -A FORWARD -p tcp --sport 635 -j DROP
> iptables -A FORWARD -p udp --sport 635 -j DROP
> #    NFS (TCP/UDP 2049)
> iptables -A FORWARD -p tcp --sport 2049 -j DROP
> iptables -A FORWARD -p udp --sport 2049 -j DROP
> #    Portmapper (TCP/UDP 111)
> iptables -A FORWARD -p tcp --sport 111 -j DROP
> iptables -A FORWARD -p udp --sport 111 -j DROP
> # Block incoming syslog, lpr, rsh, rexec...
> iptables -A FORWARD -i eth1 -p udp --dport syslog -j DROP
> iptables -A FORWARD -i eth1 -p tcp --dport 515 -j DROP
> iptables -A FORWARD -i eth1 -p tcp --dport 514 -j DROP
> iptables -A FORWARD -i eth1 -p tcp --dport 512 -j DROP
> ###
> #
> # NAT
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> ######
> #####
> #######
> iptables -A FORWARD -p tcp --sport 1719:1789 -j ACCEPT
> iptables -A FORWARD -p udp --sport 1719:1789 -j ACCEPT
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 -j DNAT --to
> 192.168.1.40:80
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 80 -j ACCEPT=

> iptables -t nat -A PREROUTING -p tcp --dport 23 -i eth1 -j DNAT --to
> 192.168.1.40:23
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 23 -j ACCEPT=

> iptables -t nat -A PREROUTING -p tcp --dport 161 -i eth1 -j DNAT --to
> 192.168.1.40:161
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 161 -j ACCEP=
T
> iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT
> --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 1726:1789 -j=

> ACCEPT
> iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT
> --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport  1726:1789 -=
j
> ACCEPT


