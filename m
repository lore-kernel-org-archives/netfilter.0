From: Jeff Bonner <lunar@comcast.net>
Subject: Performance tuning w/kernel SYSCTL options
Date: Wed, 05 Jun 2002 11:15:49 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <00cd01c20ca3$dffd57c0$0200a8c0@JEFF>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: 'netfilter' <netfilter@lists.samba.org>

I have the following in my iptables script, but commented out for now
because I'm not sure if they're necessary or useful:

# echo 30  > /proc/sys/net/ipv4/tcp_fin_timeout         # Reduce dead
sockets?
# echo 180 > /proc/sys/net/ipv4/tcp_keepalive_intvl     # Is this even
needed?

I've read some of the documentation on these (and many other SYSCTL
items), but honestly, some is above my head.  What might be the
appropriate values, if any, to use for a 1.5Mbps down/128Kbps up
cablemodem connection, on a 486/66 with Debian Woody, serving 3
NAT/masq'd machines?

Thanks in advance,

Jeff Bonner



