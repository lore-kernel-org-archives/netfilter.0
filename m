From: Tompa Septimius Paul <subzero@cj.onrc.ro>
Subject: iptables and ip_conntrack_tuple.h compile fix
Date: Tue, 1 Feb 2005 13:14:54 +0200 (EET)
Message-ID: <Pine.LNX.4.58.0502011255020.24684@cj.onrc.ro>
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: netfilter@lists.netfilter.org


Hi,

I try to recompile iptables iptables-1.2.11 with kernel 2.6.11-rc2
(and mm2) running and I don't succeed. It complains about
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_tuple.h
after this small changes iptables is compiling again.



--- ip_conntrack_tuple.h.old    2005-02-01 12:49:52.000000000 +0200
+++ ip_conntrack_tuple.h        2005-02-01 12:55:43.983819584 +0200
@@ -62,12 +62,11 @@
                                u_int16_t port;
                        } sctp;
                } u;

                /* The protocol. */
-               u8 protonum;
+               u_int16_t protonum;

                /* The direction (for tuplehash) */
-               u8 dir;
+               u_int16_t dir;
        } dst;
 };


A good day,

Tompa Septimius Paul <subzero@cj.onrc.ro>







________ Information from NOD32 ________
This message was checked by NOD32 Antivirus System for Linux Mail Server.
http://www.nod32.com
