From: Gavin Carr <gavin@openfusion.com.au>
Subject: Connection failing to SNAT
Date: Tue, 25 Jan 2005 22:18:02 +1100
Message-ID: <20050125111802.GA19384@openfusion.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi netfilter gurus,

I've got a very weird problem I need some help with. I have a very 
boring Debian Woody-based router/firewall doing SNAT between my 
internal network and the outside. Has been working fine for months.

The problem is I've got one app (asterisk) on an internal server
that is connecting via UDP to a particular host, and the connection
is failing. Same app connects fine to other hosts, and network
connectivity to the host in question from the same box looks fine - 
I can ping, I can netcat to the udp port, etc.

Debugging this, it looks like the bad outward connection is
not getting masqueraded properly - on the external interface on 
the firewall a tcpdump shows:

  04:35:18.203836 10.10.10.1.4569 > 202.125.42.141.4569:  udp 12 (DF) [tos 0x10]
  04:35:18.706606 10.10.10.1.4569 > 202.125.42.141.4569:  udp 12 (DF) [tos 0x10]
  04:35:18.707008 10.10.10.1.4569 > 202.125.42.141.4569:  udp 26 (DF) [tos 0x10]
  04:35:19.344564 203.213.47.14.4569 > 216.118.117.46.4569:  udp 12 (DF) [tos 0x10]
  04:35:19.586808 216.118.117.46.4569 > 203.213.47.14.4569:  udp 12 (DF) [tos 0x10]
  04:35:19.587876 203.213.47.14.4569 > 216.118.117.46.4569:  udp 12 (DF) [tos 0x10]

The first three lines are bad, where the 10.10.10.1 is my internal
address that isn't masqueraded. The next three lines are good to
a different host (216.118.117.46), where 203.213.47.14 is my
external (SNATed) address. 

Added some logging like so:

  # Log mangle POSTROUTING
  $IPT -t mangle -A POSTROUTING -o $EXT -j LOG --log-prefix 'MANGLE POST: '

  # Turn on SNAT
  $IPT -t nat -A POSTROUTING -o $EXT -j LOG --log-prefix 'POSTROUTING1: '
  $IPT -t nat -A POSTROUTING -o $EXT -j SNAT --to-source 203.213.47.14
  $IPT -t nat -A POSTROUTING -o $EXT -j LOG --log-prefix 'POSTROUTING2: '

and all I see in the logs for the bad connection is the 'MANGLE POST'
packets - no 'POSTROUTING1' shows up at all. So it looks like the packets
are just skipping the nat table altogether somehow?

Anyone got any idea what might be going on here, or where to look next
to try and debug this further? Same behaviour with both current woody
iptables (1.2.6a-5.0) and the backports one (1.2.11?), BTW. Nothing in
the routing table other than the two connected segments and the default
gateway.

Thanks for any suggestions.

Cheers,
Gavin



