From: Iulian Topliceanu <iulian.topliceanu@net-m.de>
Subject: IPTABLES drops packages for existing rules
Date: Fri, 23 Sep 2005 12:22:35 +0200
Message-ID: <4333D76B.9030900@net-m.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I have a Fedora Core 3 on a box with plenty of RAM (1 GB) dual P4 and
so on.

The structure is simple: 3 NICs

eth0 - ouside
eth1 - intranet
eth2 - heartbeat

There are plenty of ACCEPT rules, and in the end a general DENY rule,
to drop everything that didn't match the ACCEPT rules (obviously)

There are plenty of NAT rules as well, portforwading and stuff like.

Now, *sometimes* but just *sometimes*, ICMP and TCP packages are
simply matching the general DENY rule and dropped, though there is a
rule that says that LAN hosts can communicate without restrictions
between them (there are 8 subnets)

So, there are moments when IPTABLES is behaving like that ACCEPT rule
woudn't exist, simply denying packets from a LAN host to another LAN host.

If it matters, most of the denyed packets are ICMPs TYPE 0 (round 10
000 packets / 24 h) and TCP packets on various SQL ports (round 35
packets / 24 h)

No, this woudn't be a PITA if the monitoring system would send alarms
in these moments. Everything seems to happen randomly.

What's the problem? I guess it's an IPTABLES issue not some
ip_conntrack trick.

Thanks for the sugestions,
Iulian Topliceanu
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFDM9dqYBaCkvEor9kRAvvfAKCE/9DETQkpeyleAAAD/2a6lB1KTACfdeyw
SXZzydy/uysrCY86ZQBhjW8=
=8Mvg
-----END PGP SIGNATURE-----


