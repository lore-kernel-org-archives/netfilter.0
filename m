From: SBlaze <dagent.geo@yahoo.com>
Subject: ip_conntrack: table full, dropping packet. SAY WHA????
Date: Tue, 9 Sep 2003 15:53:50 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030909225350.6002.qmail@web40209.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: nf <netfilter@lists.netfilter.org>

I have a single windows machine NATED behind my Linux router/gateway/firewall.
I use iptables 1.2.8

info on the module I found is this

root@kingscross:/var/www/n00b# modinfo ip_conntrack
filename:    /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_conntrack.o
description: <none>
author:      <none>
license:     "GPL"
parm:        hashsize int

I like to play CounterStrike. When I update the list from Master Servers 
I get this in my /var/log/messages file and it's sent to STDOUT

Sep  8 22:18:06 kingscross kernel: NET: 347 messages suppressed.
Sep  8 22:18:06 kingscross kernel: ip_conntrack: table full, dropping packet.
Sep  8 22:18:11 kingscross kernel: NET: 392 messages suppressed.
Sep  8 22:18:11 kingscross kernel: ip_conntrack: table full, dropping packet.
Sep  8 22:18:16 kingscross kernel: NET: 371 messages suppressed.
Sep  8 22:18:16 kingscross kernel: ip_conntrack: table full, dropping packet.
Sep  8 22:18:21 kingscross kernel: NET: 414 messages suppressed.
Sep  8 22:18:21 kingscross kernel: ip_conntrack: table full, dropping packet.
Sep  8 22:18:26 kingscross kernel: NET: 467 messages suppressed.
Sep  8 22:18:26 kingscross kernel: ip_conntrack: table full, dropping packet.
Sep  8 22:18:31 kingscross kernel: NET: 436 messages suppressed.
Sep  8 22:18:31 kingscross kernel: ip_conntrack: table full, dropping packet.

The suppressed messages vary..but what gives here? Here are my UDP rules for
refference.

# UDP Filters
#
#iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j LOG
iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

If someone could explain thhis to me I would appreciate it.

Thanks 
SBlaze

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

