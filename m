From: Valts Silaputnins <support@proxyswitcher.com>
Subject: iptables + local server via udp + conntracking + 2 uplinks = wrong
 source address for replies
Date: Sun, 01 Jul 2012 16:35:15 +0300
Message-ID: <4FF05213.3020204@gmail.com>
Reply-To: ValtsS@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Greetings,

 maybe someone can advise. The situation is following - I am running
ventrilo server - it's a VoIP software that uses UDP protocol for the
communication. It's server insists on binding to 0.0.0.0:3784
Unfortunately it's not working correctly if I have 2 uplinks available
(routing is:
 default
        nexthop via 46.109.xxx.1  dev wan0 weight 100
        nexthop via 46.109.xxx.1  dev wan1 weight 100
)
I have enabled connection tracking and connection marking for all the
packets arriving from the specified interfaces:
Chain PREROUTING (policy ACCEPT 4800K packets, 2097M bytes)
 pkts bytes target     prot opt in     out     source
destination
8248K 4108M CONNMARK   all  --  any    any     anywhere
anywhere             CONNMARK restore
3079K 1990M ACCEPT     all  --  any    any     anywhere
anywhere             mark match ! 0x0
 272K   16M MARK       all  --  wan0   any     anywhere
anywhere             MARK set 0x1
 272K   16M CONNMARK   all  --  wan0   any     anywhere
anywhere             mark match ! 0x0 CONNMARK save
 272K   16M ACCEPT     all  --  wan0   any     anywhere
anywhere             mark match ! 0x0
96275 5666K MARK       all  --  wan1   any     anywhere
anywhere             MARK set 0x2
96275 5666K CONNMARK   all  --  wan1   any     anywhere
anywhere             mark match ! 0x0 CONNMARK save
96275 5666K ACCEPT     all  --  wan1   any     anywhere
anywhere             mark match ! 0x0

So I have set ip rules & routing tables for it:
100:    from all fwmark 0x1 lookup 1
101:    from all fwmark 0x2 lookup 2
And it works _great_ for TCP connections either for web server running
on same box or for NATed & forwarded connections. What I see in tcpdump
for ventrilo is that it "randomly" picks the source address of either
uplink to send replies to clients, so naturally it does not work because
clients don't expect reply wrong wrong IP address.
So in my naivety I thought that issue must be that connection tracking
for some reason is not working for me. So I added rules into mangle
table of OUTPUT chain to MARK packets to go out of specific interface at
least:
Chain OUTPUT (policy ACCEPT 4792K packets, 2107M bytes)
 pkts bytes target     prot opt in     out     source
destination
7872K 2567M CONNMARK   all  --  any    any     anywhere
anywhere             CONNMARK restore
3080K  460M ACCEPT     all  --  any    any     anywhere
anywhere             mark match ! 0x0
   12  2688 MARK       udp  --  any    wan+    anywhere
anywhere             udp spt:3784 MARK set 0x1
    0     0 MARK       tcp  --  any    wan+    anywhere
anywhere             tcp spt:3784 MARK set 0x1
   12  2688 CONNMARK   all  --  any    wan+    anywhere
anywhere             mark match ! 0x0 CONNMARK save


And it kind of worked - packets started to go out the "wan0" interface.
However the source address was still wrong. Ok so I tried to fix that by
adding SNAT to POSTROUTING chain. Only to realize that for some reason
those packets don't hit it (checked by -j TRACE...).
So I started googling for reasons for this problem, however results seem
to condradict each other, some say it (well for tcp I suppose) works
fine, some say SNAT for OUTPUT doesn't work at all.
Sorry for long rambling, I am just stomped on this issue.
#uname -a
Linux arcturus 3.4.2-arcturus #7 SMP Tue Jun 19 21:08:02 EEST 2012
x86_64 Intel(R) Pentium(R) Dual  CPU  E2200  @ 2.20GHz GenuineIntel
GNU/Linux
# iptables --version
iptables v1.4.14

P.S. Can't make it to bind to specific interface sadly.

- --
Best regards, Valts Silaputnins.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (MingW32)

iEYEARECAAYFAk/wUhMACgkQ7nq3gp3q9WMVUQCgzUMvfX8WS0K31ee34pX7eO5+
i3EAn0Vg8KF1t+e+7gybEbmpwNRICdUI
=EC7C
-----END PGP SIGNATURE-----
