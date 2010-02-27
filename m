From: "U. George" <netbeans@gatworks.com>
Subject: multiport needs `-p tcp', `-p udp' - Why?
Date: Sat, 27 Feb 2010 10:03:15 -0500
Message-ID: <4B893433.7020401@gatworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

In order to get to the chain, the protocol, as well as the interface 
must match. PRE_UDP if already filtered for "-p udp" . So why does 
multiport require another check for -p udp? Does it really need to have 
that option in order for it to work?

> + /sbin/iptables -t filter -N PRE_UDP
> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport 137,138,139,512,514,515,1433,1434 -j DROP
> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite', `-p sctp' or `-p dccp'
> Try `iptables -h' or 'iptables --help' for more information.



