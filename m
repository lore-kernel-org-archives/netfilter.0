From: Folkert van Heusden <folkert@vanheusden.com>
Subject: transparent proxying NTP
Date: Sun, 27 Jun 2004 21:43:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406272137520.29785-100000@muur.intranet.vanheusden.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'm trying to do transparent proxying for NTP.
I want to do that as some access points I have over here want to sync their
time to some server in Amerika. Not so efficient as I live in europe and
have in fact my own local stratum 1 timeserver.
So, I tried this:
iptables -t nat -A PREROUTING -i eth1 -s ! 192.168.64.1 -p udp --dport 123 -j DNAT --to 192.168.64.1:123
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/16 -d 192.168.64.1 -j SNAT --to 127.0.0.1

But when I do a tcpdump on ppp0 of my gateway (the adsl connection) and do
netdate ntp.xs4all.nl from a host on my lan (192.168.64.99), I still see
requests coming from that host to the internet!
I guess I'm doing something obvious wrong here but I'm not sure what.
Could someone please enlighten me?


Folkert van Heusden

+--------------------------------------------------------------------------+
| UNIX sysop? Then give MultiTail ( http://www.vanheusden.com/multitail/ ) |
| a try, it brings monitoring logfiles to a different level! See:          |
| http://www.vanheusden.com/multitail/features.html for a feature list.    |
+---------------------------------------------------= www.vanheusden.com =-+


