From: "outspoken" <outspoken@gru.net>
Subject: Re: simple, but not for me.
Date: Sun, 30 Jun 2002 01:54:24 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <00b401c21ffa$96cb0dd0$0200a8c0@SILVERBEAST>
References: <20020630053506.43C3143FD@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

understood. i apologize for the sloppy script, i have been too busy to clean
it up and this was thrown together in the last couple days.
disregard the ACCEPT INPUT rule as its only a temporary solution and i know
its a bad security plan, but i have too much going on right now, over the
next few weeks i will resolve it. =)


#!/bin/bash
echo "[-----firewall module init-----]"
cd /lib/modules/2.4.10-4GB/kernel/net/ipv4/netfilter
insmod ip_tables
insmod ip_conntrack
insmod ipt_state
insmod ipt_limit
insmod iptable_filter.o
insmod iptable_mangle.o
insmod ipt_LOG.o
insmod ipt_MASQUERADE.o
insmod ipt_REDIRECT.o
insmod ipt_REJECT.o
insmod iptable_nat.o

echo "[-----clearing firewall rulesets-----]"
iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

echo "[-----network address translation---]"

extif=eth0
intif=eth1

extip=xxx.xxx.xxx.xxx
intip=192.168.0.1
webip=192.168.0.8

iptables -t nat -F
#iptables -t nat -A prerouting -o $extif -j DNAT --to-destination $extip
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

echo "[-----enabling spoof protection-----]"
#if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
#then
#for f in /proc/sys/net/ipv4/conf/*/rp_filter
#do
#echo 1 > $f
#done
#fi

for blah in /proc/sys/net/ipv4/conf/*/rp_filter; do
echo "1" > $blah
done

echo "[-----setting external rulesets-----]"
iptables -A INPUT -i eth0 -f -j DROP
iptables -A INPUT -i eth0 -p TCP --syn -m limit --limit 1/s -j ACCEPT
iptables -A INPUT -i eth0 -p TCP --tcp-flags SYN,ACK,FIN,RST RST -m
limit --limit 1/s -j ACCEPT
iptables -A INPUT -i eth0 -p TCP --dport 32768:61000 -m state --state
ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p ICMP --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -i eth0 -p TCP --dport 137 -j DROP
iptables -A INPUT -i eth0 -p UDP --dport 137 -j DROP
iptables -A INPUT -i eth0 -p TCP --dport 138 -j DROP
iptables -A INPUT -i eth0 -p UDP --dport 138 -j DROP
iptables -A INPUT -i eth0 -p TCP --dport 139 -j DROP
iptables -A INPUT -i eth0 -p UDP --dport 139 -j DROP

iptables -A INPUT -i eth0 -p TCP --dport 32768:61000 -m state --state
ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p TCP --sport 32768:61000 --dport 22 -m
state --state NEW,ESTABLISHED -j ACCEPT

echo "[-----setting internal rulesets-----]"
iptables -A FORWARD -i eth1 -d 10.0.0.0/8 -j DROP
iptables -A FORWARD -i eth1 -d 127.0.0.0/8 -j DROP
iptables -A FORWARD -i eth1 -p igmp -j DROP
iptables -A FORWARD -i eth1 -p TCP --syn -m limit --limit 10/s -j ACCEPT
iptables -A FORWARD -i eth1 -p TCP --tcp-flags SYN,ACK,FIN,RST RST -m
limit --limit 10/s -j ACCEPT
iptables -A INPUT -i eth1 -p TCP -s 0/0 -d 0/0 --dport 113 -m state --state
ESTABLISHED,NEW -j ACCEPT
iptables -A INPUT -i eth1 -p TCP -s 0/0 -d 0/0 --dport 22 -m state --state
NEW,ESTABLISHED -j ACCEPT

echo "[-----setting internal rulesets-----]"
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -i eth1 -p ICMP -s 192.168.0.0/24 -j ACCEPT

echo "[-----setting forward rulesets-----]"
iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -p TCP -j
ACCEPT
iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -p UDP -j
ACCEPT


> --__--__--
>
> Message: 3
> Date: Sat, 29 Jun 2002 22:25:42 -0700
> From: Jack Bowling <jbinpg@shaw.ca>
> Subject: Re: simple, but not for me.
> To: netfilter@lists.samba.org
> Reply-To: Jack Bowling <jbinpg@shaw.ca>
>
> ** Reply to message from outspoken <outspoken@gru.net> on Sun, 30 Jun 2002
00:04:09 -0400
>
>
> > ok, ill lay out a simple plan of what i need done. of course ive tried a
lot of the options listed in this listeserv, and cant seem to get them
working properly. also read some howtos and other various things but just
came seem to get things working. there was one post that i thought was going
to be helpful recently, but all they talked about was how its a security
risk and they should really look into a dmz. well i cant right now since i
don't have another ethernet card so please someone post simple iptables
examples for me to use. =)
> >
> >
> > i have a machine = 192.168.0.8 which is behind the firewall =
192.168.0.1
> > what i need to do is have 192.168.0.8 be visible to the public for web
serving, ssh, mysql.
> > that is all.
> >
> > my nat setup currently works fine with 3 machines behind the firewall.
> >
> > modules loaded:
> <snip>
>
> Just an aside - we are not likely to be much help unless you post your
whole ruleset. We do not know your default chain policies for one which will
determine a lot.
>
> jb
>
>



