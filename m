From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: simple, but not for me.
Date: Sun, 30 Jun 2002 01:04:17 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYI00ERLEF9TJ@l-daemon>
References: <20020630053506.43C3143FD@lists.samba.org>
 <00b401c21ffa$96cb0dd0$0200a8c0@SILVERBEAST>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00b401c21ffa$96cb0dd0$0200a8c0@SILVERBEAST>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from outspoken <outspoken@gru.net> on Sun, 30 Jun 2002 01:54:24 -0400


> understood. i apologize for the sloppy script, i have been too busy to clean
> it up and this was thrown together in the last couple days.
> disregard the ACCEPT INPUT rule as its only a temporary solution and i know
> its a bad security plan, but i have too much going on right now, over the
> next few weeks i will resolve it. =)
> 
> 
> #!/bin/bash
> echo "[-----firewall module init-----]"
> cd /lib/modules/2.4.10-4GB/kernel/net/ipv4/netfilter
> insmod ip_tables
> insmod ip_conntrack
> insmod ipt_state
> insmod ipt_limit
> insmod iptable_filter.o
> insmod iptable_mangle.o
> insmod ipt_LOG.o
> insmod ipt_MASQUERADE.o
> insmod ipt_REDIRECT.o
> insmod ipt_REJECT.o
> insmod iptable_nat.o

First off, lose the .o suffix from the above modules otherwise they won't load.
Second,  it's a good habit to use modprobe instead of insmod since modprobe takes care of dependencies.
 
> echo "[-----clearing firewall rulesets-----]"
> iptables -F INPUT
> iptables -F FORWARD
> iptables -F OUTPUT
> iptables -P INPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -P OUTPUT ACCEPT

Hehehehe. I'll take you at your word that you know the above policies are A VERY BAD THING. Default policies on at least INPUT and FORWARD should be DROP, IMHO.

> 
> echo "[-----network address translation---]"
> 
> extif=eth0
> intif=eth1
> 
> extip=xxx.xxx.xxx.xxx
> intip=192.168.0.1
> webip=192.168.0.8
> 
> iptables -t nat -F
> #iptables -t nat -A prerouting -o $extif -j DNAT --to-destination $extip
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> echo "[-----enabling spoof protection-----]"
> #if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
> #then
> #for f in /proc/sys/net/ipv4/conf/*/rp_filter
> #do
> #echo 1 > $f
> #done
> #fi
> 
> for blah in /proc/sys/net/ipv4/conf/*/rp_filter; do
> echo "1" > $blah
> done
> 
> echo "[-----setting external rulesets-----]"
> iptables -A INPUT -i eth0 -f -j DROP
> iptables -A INPUT -i eth0 -p TCP --syn -m limit --limit 1/s -j ACCEPT
> iptables -A INPUT -i eth0 -p TCP --tcp-flags SYN,ACK,FIN,RST RST -m
> limit --limit 1/s -j ACCEPT
> iptables -A INPUT -i eth0 -p TCP --dport 32768:61000 -m state --state
> ESTABLISHED -j ACCEPT
> iptables -A INPUT -i eth0 -p ICMP --icmp-type echo-reply -j ACCEPT
> iptables -A INPUT -i eth0 -p TCP --dport 137 -j DROP
> iptables -A INPUT -i eth0 -p UDP --dport 137 -j DROP
> iptables -A INPUT -i eth0 -p TCP --dport 138 -j DROP
> iptables -A INPUT -i eth0 -p UDP --dport 138 -j DROP
> iptables -A INPUT -i eth0 -p TCP --dport 139 -j DROP
> iptables -A INPUT -i eth0 -p UDP --dport 139 -j DROP
> 
> iptables -A INPUT -i eth0 -p TCP --dport 32768:61000 -m state --state
> ESTABLISHED -j ACCEPT
> iptables -A INPUT -i eth0 -p TCP --sport 32768:61000 --dport 22 -m
> state --state NEW,ESTABLISHED -j ACCEPT
> 
> echo "[-----setting internal rulesets-----]"
> iptables -A FORWARD -i eth1 -d 10.0.0.0/8 -j DROP
> iptables -A FORWARD -i eth1 -d 127.0.0.0/8 -j DROP
> iptables -A FORWARD -i eth1 -p igmp -j DROP
> iptables -A FORWARD -i eth1 -p TCP --syn -m limit --limit 10/s -j ACCEPT
> iptables -A FORWARD -i eth1 -p TCP --tcp-flags SYN,ACK,FIN,RST RST -m
> limit --limit 10/s -j ACCEPT

This is what you need to port forward (assuming standard ports):

#Forward web services to internal host
iptables -t nat -A PREROUTING -p tcp -d $extip --dport 80 -j DNAT--to 192.168.0.8:80

#Forward ssh to internal host
iptables -t nat -A PREROUTING -p tcp -d $extip --dport 22 -j DNAT--to 192.168.0.8:22

#Forward mysql to internal host
iptables -t nat -A PREROUTING -p tcp -d $extip --dport 3306 -j DNAT--to 192.168.0.8:3306

Remember to shut off the above services on your firewall box. And when you change your default FORWARD policy to DROP, you will have to add an explicit -j ACCEPT before each above port forward rule in the FORWARD chain.

> iptables -A INPUT -i eth1 -p TCP -s 0/0 -d 0/0 --dport 113 -m state --state
> ESTABLISHED,NEW -j ACCEPT
> iptables -A INPUT -i eth1 -p TCP -s 0/0 -d 0/0 --dport 22 -m state --state
> NEW,ESTABLISHED -j ACCEPT
> 
> echo "[-----setting internal rulesets-----]"
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A FORWARD -i eth1 -p ICMP -s 192.168.0.0/24 -j ACCEPT
> 
> echo "[-----setting forward rulesets-----]"
> iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -p TCP -j
> ACCEPT
> iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -p UDP -j
> ACCEPT

jb

