From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: rc.firewall script
Date: Wed, 12 Nov 2003 09:03:16 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031112170316.69571.qmail@web40204.mail.yahoo.com>
References: <Pine.LNX.4.53.0311101822110.1446@hardon.truncatedtetrahedron.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0311101822110.1446@hardon.truncatedtetrahedron.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kelly Shutt <tetrahedron@hardon.truncatedtetrahedron.com>, netfilter@lists.netfilter.org


--- Kelly Shutt <tetrahedron@hardon.truncatedtetrahedron.com> wrote:
> Can someone look over my rc script.  I'm relatively new to iptables, so I
> just want to make sure I'm not doing something that's just totally insane.
> Any input on this would be nice, I'm still trying to figure out exactly
> how secure i want to get with this.
> 
> Thanks,
> Kelly Shutt> ##!/bin/sh
> echo -e "- rc.firewall ruleset -"
> #IPTABLES=/sbin/iptables
> IPTABLES=/usr/sbin/iptables
> 
> 
> echo "Verifying that all kernel modules are ok"
> /sbin/depmod -a
> 
> 
> #/sbin/insmod ip_nat_ftp
> #/sbin/insmod ip_conntrack_ftp
> 
> 
> echo "Enabling packet forwarding in the kernel"
> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> 
> echo "Enabling dynamic addressing measures"
> echo "1" > /proc/sys/net/ipv4/ip_dynaddr
> 
> 
> echo "Flushing old IP Tables"
> $IPTABLES -F
> $IPTABLES -X
> 
> 
> echo "Setting the INPUT policies"
> $IPTABLES -P INPUT REJECT
> echo "  -Setting tcp packet policies"
> $IPTABLES -A INPUT -p tcp --dport 21 -j ACCEPT		#ftp
> $IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT		#ssh
> $IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT		#smtp
> $IPTABLES -A INPUT -p tcp --dport 37 -j ACCEPT		#time
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT		#domain
> $IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT		#http
> $IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT		#auth
> $IPTABLES -A INPUT -p tcp --dport 3333 -j ACCEPT	#eggdrop
> echo "  -Setting icmp packet policies"
> $IPTABLES -A INPUT -p icmp --icmp-type 8 -j ACCEPT	#echo
> $IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT	#time extend
> echo "  -Setting udp packet policies"
> $IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT		#domain
> $IPTABLES -A INPUT -p udp -i eth1 --dport 67 --sport 68 -j ACCEPT	#dhcp
> requests
> 
> 
> echo "Setting the OUTPUT policies"
> $IPTABLES -P OUTPUT ACCEPT
> 
> 
> echo "Setting the FORWARD policies"
> $IPTABLES -P FORWARD ACCEPT
> $IPTABLES -t nat -A PREROUTING -p tcp --dport 3389 -i eth0 -j DNAT
> --to-destination 192.168.0.2-192.168.0.100
> 
> 
> echo "Enabling SNAT (IPMASQ) functionality on eth0"
> $IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> 
> echo -e "\nDone.\n"
> 


Perhaps not that important...but it's good to know. when you flush you only
flush your filter table yet later in the script you place rules in a nat
table... You might want to flush those as well before calling nat rules
again..otherwise you get reaccuring nat lines...

iptables -F
iptables -t nat -F

The above solves the problem. Remember to do this if you ever use the mangle
table as well.

Hope this helps 
SBlaze

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

